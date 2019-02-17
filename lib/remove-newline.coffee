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
      'remove-newline:replace': => @replace(/\n+/g, atom.config.get('remove-newline.insertString'))

  deactivate: ->
    @subscriptions.dispose()

  replace: (regexp, str) ->
    if editor = atom.workspace.getActiveTextEditor()
      selections = editor.getSelections()
      for selection in selections
        text = selection.getText()
        selection.insertText(text.replace(regexp, str))
