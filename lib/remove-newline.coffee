{CompositeDisposable} = require 'atom'

module.exports = RemoveNewline =
  subscriptions: null

  config:
    insertString:
      type: 'string'
      default: '-'

  activate: ->
    @subscriptions = new CompositeDisposable

    @subscriptions.add atom.commands.add 'atom-workspace',
      'remove-newline:remove': => @replace(/\n+/g, ''),
      'remove-newline:shrink': => @replace(/\n+/g, ' '),
      'remove-newline:replace': => @replace(/\n+/g, atom.config.get('remove-newline.insertString')),
      "remove-newline:pasteandshrink": => 
          editor = atom.workspace.getActiveTextEditor()
          # If there's no active text editor, then default to the normal paste command.
          # credit to https://discuss.atom.io/t/how-do-i-enable-sublime-like-paste-and-indent/41294/2
          if not editor then atom.commands.dispatch document.querySelector('atom-workspace'), 'core:paste'
          else
            editor.pasteText({select: true})
            @replace(/\n+/g, ' ')

  deactivate: ->
    @subscriptions.dispose()

  replace: (regexp, str) ->
    if editor = atom.workspace.getActiveTextEditor()
      selections = editor.getSelections()
      for selection in selections
        text = selection.getText()
        selection.insertText(text.replace(regexp, str))
