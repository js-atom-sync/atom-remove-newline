# remove-newline package

Remove newline characters (\n) in the selected text.

## Install
```sh
apm install remove-newline
```

Or search for `remove-newline` in Atom settings view.

## Commands

### Remove Newline: Remove

```
aa bb   c c  dd => aabbccdd
```

```

### Remove Whitespace: Replace

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
  'ctrl-alt-s': 'remove-newline:shrink'
  'ctrl-alt-p': 'remove-newline:replace'
  
  This is a fork of remove-whitespace
```
