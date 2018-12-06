class Service {
  constructor(options) {
    this.options = options;
  }
}

function makeService(options) {
  return new Service(options);
}

makeService.Service = Service;

export default makeService;
