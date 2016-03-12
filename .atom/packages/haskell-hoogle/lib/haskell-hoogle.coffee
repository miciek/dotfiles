Shell = require 'shell'
conv = new (require 'showdown').Converter()

module.exports = HaskellHoogle =
  activate: (state) ->
    atom.commands.add 'atom-workspace', 'haskell-hoogle:lookup', => @lookup()

  getSearchText: () ->
    editor = atom.workspace.getActivePaneItem()
    return editor.getLastSelection().getText()

  lookup: ->
    text = @getSearchText()
    url = 'https://www.haskell.org/hoogle/?mode=json&hoogle='+text+'&start=1&count=100'
    req = new XMLHttpRequest()
    req.open("GET", url, false) #FIXME: this should be async
    req.send(null)
    reply = JSON.parse(req.responseText)
    if reply.parseError || reply.results.length == 0
      atom.notifications.addWarning('No documentation for "'+text+'"', {dismissable: true})
    else
      for res in reply.results
        htmlRes = '<span class="haskell-hoogle-notification-self">'+res.self+'</span>'+
                  '<br/>'+conv.makeHtml(res.docs)+
                  '<a class="haskell-hoogle-doc-link" href="'+res.location+'">doc</a>'
        atom.notifications.addInfo(htmlRes, {dismissable: true})
