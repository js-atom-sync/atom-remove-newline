# remove-newline package

Remove, shrink, replace newline (\n) in the selected text.

## Install
```sh
apm install remove-newline
```

Or search for `remove-newline` in Atom settings view.

## Commands

### Remove newline: Remove

```
aa bb   c c  dd => aabbccdd
```

### Remove newline: Replace

You can change the inserted string in package setting.

```
aa bb   c c  dd => aa-bb-c-c-dd
```

## Keymap

No keymap by default. Please edit `~/.atom/keymap.cson`.

For example:
```coffeescript
'atom-workspace':
  'ctrl-alt-r': 'remove-newline:remove'
  'ctrl-alt-p': 'remove-newline:replace'
```
