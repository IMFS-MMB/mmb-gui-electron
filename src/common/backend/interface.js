import { platform } from 'os';
import semver from 'semver';
import { readFileSync } from 'fs';
import { resolve } from 'path';
import execute from './execute';
import { isProduction } from '../../config/constants';

class Base {
  constructor(options) {
    const {
      path, cwd, defaultArgs, ver,
    } = options;

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
    try {
      const versionFile = readFileSync(resolve(this.path, '..', '..', 'VersionInfo.xml'), { encoding: 'utf8' });
      const [, version] = versionFile.match(/<version>(.*)<\/version>/);

      if (version) {
        return version;
      }
    } catch (e) {
      // noop
    }

    return super.getVersion();
  }
}

export const InterfaceType = {
  Matlab: 'matlab',
  Octave: 'octave',
};

export function create(options) {
  const { type, ...options1 } = options;

  switch (type) {
    case InterfaceType.Matlab:
      return new Matlab(options1);
    case InterfaceType.Octave:
      return new Octave(options1);
    default:
      throw new Error(`Unknown type: ${type}`);
  }
}
