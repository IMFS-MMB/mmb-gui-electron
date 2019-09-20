import { platform } from 'os';
import semver from 'semver';
import execute from './execute';
import { isProduction } from '../../constants';

class Base {
  constructor(options) {
    const {
      path, cwd, defaultArgs, ver,
    } = options;

    const pathExists = true;
    // const pathExists = commandExists.sync(path) || isExecutableSync(path);

    if (!pathExists) {
      throw new Error(`${path} doesn't exist or is not executable.`);
    }

    this.path = path;
    this.cwd = cwd;
    this.defaultArgs = defaultArgs;
    this.semver = semver.coerce(ver || '0.0.0');
  }

  getArgs(...args) {
    return [...this.defaultArgs, ...args];
  }

  async getVersion() {
    const pattern = /%version-start%(.*)%version-end%/;
    let version = '';

    await this.runCode('disp([\'%version-start%\' version() \'%version-end%\']); exit()', (data) => {
      const match = data.toString()
        .match(pattern);

      if (match) {
        [, version] = match;
      }
    });

    return version;
  }

  /**
   * @private
   */
  async execute(args, onData, onError) {
    return execute(this.path, this.cwd, args, onData, onError);
  }

  // eslint-disable-next-line
  async destroy() {
  }
}

export class Octave extends Base {
  constructor(options) {
    super({
      ...options,
      defaultArgs: ['--no-gui'],
    });
  }

  async runCode(code, onData, onError) {
    const args = this.getArgs('--eval', code);

    return this.execute(args, onData, onError);
  }
}

export class Matlab extends Base {
  constructor(options) {
    const defaultArgs = ['-nodesktop', '-nosplash', '-nojvm', '-noFigureWindows'];
    const platformArgs = {
      // '-log' is undocumented, but seems to send output to stdout for some versions of matlab.
      // https://stackoverflow.com/a/41818741/5227141
      win32: ['-wait', '-log'],
      linux: ['-nodisplay'],
      darwin: ['-nodisplay'],
    };

    defaultArgs.push(...platformArgs[platform()]);

    super({
      ...options,
      defaultArgs,
    });
  }

  async runCode(code, onData, onError) {
    const isWindows = platform() === 'win32';

    if (isWindows) {
      code = code.replace(/"/g, '\\"');
    }

    let args;

    const matchesVersion = ver => semver.satisfies(this.semver, ver);

    if (matchesVersion('<9.6.0')) {
      if (isWindows && !isProduction) {
        // < R2019a doesn't have any output through stdout, so we need the actual matlab window
        // to show errors
        code = code.replace('exit();', '');
      }

      args = this.getArgs('-r', code);
    } else if (matchesVersion('>=9.6.0')) {
      args = this.getArgs('-batch', code);
    }

    return this.execute(args, onData, onError);
  }

  async getVersion() {
    // matlab prints a header to stdout. remove it by just getting everything after the last \n
    const headerAndVersion = await super.getVersion();
    const split = headerAndVersion.split('\n');

    return split[split.length - 1];
  }
}

export function create(options) {
  const { type, ...options1 } = options;

  switch (type) {
    case 'matlab':
      return new Matlab(options1);
    case 'octave':
      return new Octave(options1);
    default:
      throw new Error(`Unknown type: ${type}`);
  }
}
