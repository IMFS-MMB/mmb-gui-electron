import { platform } from 'os';
import execute from './execute';

class Base {
  constructor(options) {
    const { path, cwd, defaultArgs } = options;

    const pathExists = true;
    // const pathExists = commandExists.sync(path) || isExecutableSync(path);

    if (!pathExists) {
      throw new Error(`${path} doesn't exist or is not executable.`);
    }

    this.path = path;
    this.cwd = cwd;
    this.defaultArgs = defaultArgs;
  }

  getArgs(...args) {
    return [...this.defaultArgs, ...args];
  }

  async getVersion() {
    let version;

    await this.runCode('fprintf(version);', (data) => {
      version = data.toString();
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
  async destroy() {}
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
    const defaultArgs = ['-nodesktop', '-nosplash', '-nojvm', '-nodisplay', '-noawt', '-noFigureWindows'];

    // '-log' is undocumented, but seems to send output to stdout for some versions of matlab.
    // https://stackoverflow.com/a/41818741/5227141
    if (platform() === 'win32') {
      defaultArgs.push('-wait', '-log');
    }

    super({
      ...options,
      defaultArgs,
    });
  }

  async runCode(code, onData, onError) {
    const args = this.getArgs('-r', code);

    return this.execute(args, onData, onError);
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
