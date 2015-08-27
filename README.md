Sublime ETPL
===

An ETPL syntax definition & snippets specifically for Sublime Text.

## About ETPL

[ETPL](http://ecomfe.github.io/etpl/) is a reusable, flexible, high-performance JavaScript template engine for Browser & Node.

## Screenshot

_Default_ syntax & `base16-ocean.dark.tmTheme`:

<img width="865" alt="Base 16 Ocean" src="https://cloud.githubusercontent.com/assets/157338/9528527/7a85d9d4-4d27-11e5-8ffa-ace601bebf6f.png">

_Mustache style_ syntax & `Tomorrow.tmTheme`:

<img width="865" alt="Tomorrow" src="https://cloud.githubusercontent.com/assets/157338/9528567/c515dcf6-4d27-11e5-936b-1e47e994dee5.png">

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

## Settings

Go to `Preferences` > `Package Settings` > `ETPL` > `Settings - User`, insert & override the following JSON snippet:

```json
{
    "commandOpen": "<!--",
    "commandClose": "-->",
    "variableOpen": "${",
    "variableClose": "}"
}
```

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

## Contributors

* Firede: [GitHub](https://github.com/firede), [Weibo](http://weibo.com/firede)
* huanghuiquan: [GitHub](https://github.com/huanghuiquan)

## License

MIT &copy; [Baidu Inc.](./LICENSE)
