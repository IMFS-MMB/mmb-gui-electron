
// Define the Feathers schema for service `data`. (Can be re-generated.)
// !code: imports // !end
// !code: init // !end

// Define the model using JSON-schema
let schema = {
  // !<DEFAULT> code: schema_header
  title: 'Data',
  description: 'Data database.',
  // !end
  // !code: schema_definitions // !end

  // Required fields.
  required: [
    // !code: schema_required
    'model',
    'rule',
    'shock',
    'func',
    'outputvar',
    'values'
    // !end
  ],
  // Fields with unique values.
  uniqueItemProperties: [
    // !code: schema_unique // !end
  ],

  // Fields in the model.
  properties: {
    // !code: schema_properties
    'model': {
      'type': 'string'
    },
    'rule': {
      'type': 'string'
    },
    'shock': {
      'oneOf': [
        {
          'type': 'string',
          'enum': [
            'Fis',
            'Mon'
          ]
        },
        {
          'type': 'null'
        }
      ]
    },
    'func': {
      'type': 'string',
      'enum': [
        'IRF',
        'AC',
        'VAR'
      ]
    },
    'outputvar': {
      'type': 'string',
      'enum': [
        'inflation',
        'interest',
        'output',
        'outputgap'
      ]
    },
    'values': {
      'type': 'string'
    }
    // !end
  },
  // !code: schema_more
  'additionalProperties': false,
  // !end
};

// Define optional, non-JSON-schema extensions.
let extensions = {
  // GraphQL generation.
  graphql: {
    // !code: graphql_header
    name: 'Datum',
    service: {
      sort: { id: 1 },
    },
    // sql: {
    //   sqlTable: 'Data',
    //   uniqueKey: 'id',
    //   sqlColumn: {
    //     __authorId__: '__author_id__',
    //   },
    // },
    // !end
    discard: [
      // !code: graphql_discard // !end
    ],
    add: {
      // !<DEFAULT> code: graphql_add
      // __author__: { type: '__User__!', args: false, relation: { ourTable: '__authorId__', otherTable: 'id' } },
      // !end
    },
    // !code: graphql_more // !end
  },
};

// !code: more // !end

let moduleExports = {
  schema,
  extensions,
  // !code: moduleExports // !end
};

// !code: exports // !end
module.exports = moduleExports;

// !code: funcs // !end
// !code: end // !end
