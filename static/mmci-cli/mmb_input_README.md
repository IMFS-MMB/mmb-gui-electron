
### README for mmb_input.db

<<<<<<< HEAD
The SQLite database contains all relevant informations on models and policy rules. It will be processed by the GUI, CLI and on the website.

It contains the following tables, followed by their datatype.

## Table1: models
	* `model_id` INTEGER UNIQUE
	* `internal_name` text NOT NULL UNIQUE
	* `path` text NOT NULL
	* `description_id` integer 
	* `interest` INTEGER 
	* `inflation` INTEGER
	* `outputgap` INTEGER
	* `outpu` INTEGER
	* `interest_` INTEGER
	* `fiscal_` INTEGER
	* `prule01` INTEGER
	* ...
	* `prule09` INTEGER

The policy rules (prules) contain boolean data on whether the model works with the respective policy rule (e.i. NULL) or not (value of 1).

The description_id links to an entry from the 'description' table.

## Table2: prules

	* `prule_id` INT UNIQUE
	* `internal_name` text
	* `description_id` int
	* `param1` real
	* `param2` real
	* ...
	* `param33` real


## Table3: description

	* `description_id` INT NOT NULL
	* `ac_ref` text NOT NULL
	* `paper_title` text
	* `journal` text
	* `replicants_name` text
	* `pub_date` text
	* `keywords` text
	* `description` text
	* `author1` text
	* `author2` TEXT
	* `author3` TEXT
	* `author4` TEXT
	* `author_n` TEXT
=======
The SQLite database contains all relevant information on models and policy rules. It will be processed by the GUI, CLI and on the website.

## Table 'authors'
    id              INTEGER primary key autoincrement,
    name            TEXT not null

## Table 'descriptions'
Contains information on a prules or model entry.

    id              INTEGER primary key autoincrement,
    ac_ref          TEXT,
    paper_title     TEXT,
    journal         TEXT,
    replicants_name TEXT,
    pub_date        TEXT,
    keywords        TEXT,
    description     TEXT

## Table 'prules'
Available policy rules. Will be populated with `params` through table `prule_params`

    id              INTEGER primary key autoincrement,
    description_id  INTEGER,
    internal_name   TEXT

## Table 'models'
Available models. `interest` through `fiscal_shock` indicate availability of specific model features.

    id              INTEGER primary key autoincrement,
    description_id  INTEGER not null,
    internal_name   TEXT    not null,
    path            TEXT,
    interest        TINYINT(1),
    inflation       TINYINT(1),
    outputgap       TINYINT(1),
    output          TINYINT(1),
    mp_shock        TINYINT(1),
    fiscal_shock    TINYINT(1)

## Table 'params'
Params available for building prules. `position` is to help with ordering params in case the order can't be determined by `id` in the future. Can equal `id` for now.
`text_markup` can contain markup for pretty rendering of parameters in the future.

    id              INTEGER primary key autoincrement,
    name            TEXT    not null,
    position        INTEGER not null unique,
    text_plain      TEXT,
    text_markup     TEXT,
    description     TEXT

## Table 'prule_params'
Many-to-many relationships of `prules` and `params`. `value` is the value of a specific param in a specific policy rule.

    prule_id        INTEGER not null,
    param_id        INTEGER not null,
    value           TEXT    not null

## Table 'description_authors'
Many-to-many relationships of `descriptions` and `authors`

    description_id  INTEGER not null,
    author_id       INTEGER not null

## Table 'model_prules'
Many-to-many relationships of `models` and `prules`

    model_id        INTEGER not null,
    prule_id        INTEGER not null
>>>>>>> 08e199d97f64b105aec1767b969169a6a1df301d
