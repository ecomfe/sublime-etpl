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

    git clone https://github.com/ecomfe/sublime-etpl.git ETPL

The `Packages` directory is located at:

* Sublime Text 3
    * OS X: `~/Library/Application Support/Sublime Text 3/Packages/`
    * Linux: `~/.Sublime Text 3/Packages/`
    * Windows: `%APPDATA%/Sublime Text 3/Packages/`
* Sublime Text 2
    * OS X: `~/Library/Application Support/Sublime Text 2/Packages/`
    * Linux: `~/.Sublime Text 2/Packages/`
    * Windows: `%APPDATA%/Sublime Text 2/Packages/`

### Get it through Sublime Package Control

If you haven't used it yet, just install it from the link above and then:

1. Press <kbd>Shift</kbd> + <kbd>Command</kbd> (or <kbd>Ctrl</kbd>) + <kbd>P</kbd>
2. Type `install`, to bring up the "Package Control: Install Package" option, and press <kbd>Enter</kbd>
3. Look for `ETPL`, and press <kbd>Enter</kbd> to install it.

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
