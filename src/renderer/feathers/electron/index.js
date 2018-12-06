import feathers from '@feathersjs/feathers';
import feathersSequelize from 'feathers-sequelize';
import { DataTypes } from 'sequelize';

import sequelize from './sequelize';

import authors from './models/authors';
import descriptionAuthors from './models/description_authors';
import descriptions from './models/descriptions';
import modelPrules from './models/model_prules';
import models from './models/models';
import params from './models/params';
import pruleParams from './models/prule_params';
import prules from './models/prules';

import ProxyService from './services/proxy-service';

export default function () {
  const app = feathers();

  app.use('authors', feathersSequelize({
    Model: authors(sequelize, DataTypes),
    paginate: false,
  }));

  app.use('description_authors', feathersSequelize({
    Model: descriptionAuthors(sequelize, DataTypes),
    paginate: false,
  }));

  app.use('descriptions', feathersSequelize({
    Model: descriptions(sequelize, DataTypes),
    paginate: false,
  }));

  app.use('model_prules', feathersSequelize({
    Model: modelPrules(sequelize, DataTypes),
    paginate: false,
  }));

  app.use('models', feathersSequelize({
    Model: models(sequelize, DataTypes),
    paginate: false,
  }));

  app.use('params', feathersSequelize({
    Model: params(sequelize, DataTypes),
    paginate: false,
  }));

  app.use('prule_params', feathersSequelize({
    Model: pruleParams(sequelize, DataTypes),
    paginate: false,
  }));

  app.use('prules', feathersSequelize({
    Model: prules(sequelize, DataTypes),
    paginate: false,
  }));

  const proxy = feathers();

  proxy.defaultService = function defaultService(path) {
    return ProxyService({
      backendService: app.service(path),
    });
  };

  return proxy;
}
