Reflux = require('reflux')
BrowseAction = require('../actions/BrowseAction.coffee')
UserStorage = require('../utils/UserStorage.coffee')

meta = {}

ResourceStore = Reflux.createStore(

  init: ->
    this.listenTo(BrowseAction.loadMetaSuccess, this.onLoadMetaSuccess)

  onLoadMetaSuccess: (data)->
    meta = data
    this.trigger()

  currentMeta: ->
    meta
)

module.exports = ResourceStore
