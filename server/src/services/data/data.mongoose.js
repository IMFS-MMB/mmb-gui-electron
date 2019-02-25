
/* eslint quotes: 0 */
// Defines Mongoose model for service `data`. (Can be re-generated.)
const merge = require('lodash.merge');
// eslint-disable-next-line no-unused-vars
const mongoose = require('mongoose');
// !code: imports // !end
// !code: init // !end

let moduleExports = merge({},
  // !<DEFAULT> code: model
  {
    model: {
      type: String,
      required: true
    },
    rule: {
      type: String,
      required: true
    },
    shock: {
      type: String,
      required: true
    },
    func: {
      type: String,
      enum: [
        "IRF",
        "AC",
        "VAR"
      ],
      required: true
    },
    outputvar: {
      type: String,
      enum: [
        "inflation",
        "interest",
        "output",
        "outputgap"
      ],
      required: true
    },
    values: {
      type: String,
      required: true
    }
  },
  // !end
  // !code: moduleExports // !end
);

// !code: exports // !end
module.exports = moduleExports;

// !code: funcs // !end
// !code: end // !end
