Sublime ETPL
===

An ETPL syntax definition & snippets specifically for Sublime Text.

## About ETPL

[ETPL](http://ecomfe.github.io/etpl/) is a reusable, flexible, high-performance JavaScript template engine for Browser & Node.

## Screenshot

<img width="906" alt="Base 16 Ocean" src="https://cloud.githubusercontent.com/assets/157338/9234352/f8621de0-416a-11e5-9288-7409a647f8fa.png">

<img width="906" alt="Tomorrow" src="https://cloud.githubusercontent.com/assets/157338/9234358/ffdaffd8-416a-11e5-964c-a6a23be84dbc.png">

## Install

### Get it through Git

Clone the repository in your Sublime Text `Packages` directory:

    git clone git@github.com:ecomfe/sublime-etpl.git ETPL

The `Packages` directory is located at:

* Sublime Text 3
    * OS X: `~/Library/Application Support/Sublime Text 3/Packages/`
    * Linux: `~/.Sublime Text 3/Packages/`
    * Windows: `%APPDATA%/Sublime Text 3/Packages/`
* Sublime Text 2
    * OS X: `~/Library/Application Support/Sublime Text 2/Packages/`
    * Linux: `~/.Sublime Text 2/Packages/`
    * Windows: `%APPDATA%/Sublime Text 2/Packages/`

### Git it through Sublime Package Control

Next version, maybe :grin:

## Usage

### Comments

Key bindings for `<!-- // ETPL_COMMENTS -->`:

* OS X: <kbd>Command</kbd> + <kbd>/</kbd>
* Linux/Windows: <kbd>Ctrl</kbd> + <kbd>/</kbd>

### Snippets

* `target:` + <kbd>Tab</kbd> → `<!-- target: TARGET_NAME(master = MASTER_NAME) -->`
* `block:` + <kbd>Tab</kbd> → `<!-- block: BLOCK_NAME --> ... <!-- /block -->`
* `import:` + <kbd>Tab</kbd> → `<!-- import: TARGET_NAME -->`
* `use:` + <kbd>Tab</kbd> → `<!-- use: TARGET_NAME(ASSIGNMENT_EXPRESSIONS) -->`
* `var:` + <kbd>Tab</kbd> → `<!-- var: VAR_NAME = EXPRESSION -->`
* `for:` + <kbd>Tab</kbd> → `<!-- for: VARIABLE as ITEM, KEY_OR_INDEX --> ... <!-- /for -->`
* `if:` + <kbd>Tab</kbd> → `<!-- if: CONDITIONAL_EXPRESSION --> ... <!-- /if -->`
* `elif:` + <kbd>Tab</kbd> → `<!-- elif: CONDITIONAL_EXPRESSION -->`
* `else:` + <kbd>Tab</kbd> → `<!-- else -->`
* `filter:` + <kbd>Tab</kbd> → `<!-- filter: FILTER_NAME(ARGUMENTS) --> ... <!-- /filter -->`

## Related

* ETPL: [Website](http://ecomfe.github.io/etpl/), [GitHub](https://github.com/ecomfe/etpl)

## License

MIT &copy; [Baidu Inc.](./LICENSE)
