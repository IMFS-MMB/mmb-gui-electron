class Service {
  backendService;
  path;
  events;

  constructor(options) {
    this.backendService = options.backendService;

    this.events = [...this.backendService.events || []];
  }

  async get(...args) { return this.backendService.get(...args); }
  async find(...args) { return this.backendService.find(...args); }
  async create(...args) { return this.backendService.create(...args); }
  async remove(...args) { return this.backendService.remove(...args); }
  async update(...args) { return this.backendService.update(...args); }
  async patch(...args) { return this.backendService.patch(...args); }

  setup() {
    this._setup(); // eslint-disable-line
  }

  _setup(app) {
    this.app = app;

    this.eventNames().forEach((event) => {
      this.backendService.on(event, (...args) => this.emit(event, ...args));
    });
  }
}

function makeService(options) {
  return new Service(options);
}

makeService.Service = Service;

export default makeService;
