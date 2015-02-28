Reflux = require('reflux')
ajax = require('superagent')

UserStorage = require('../utils/UserStorage.coffee')

accessToken = ->
  UserStorage.currentUser().accessToken

BrowseAction = Reflux.createActions([
  'loadMeta',
  'loadMetaSuccess',
  'loadMetaError',
])

BrowseAction.loadMeta.preEmit = (path = "") ->
  ajax
    .get("https://api.dropbox.com/1/metadata/auto/#{path}")
    .query({ access_token: accessToken() })
    .accept('json')
    .end((res) ->
      if res.error
        BrowseAction.loadMetaError(res.error)
      else
        BrowseAction.loadMetaSuccess(res.body)
    )

BrowseAction.loadMetaSuccess.preEmit = (data) ->

BrowseAction.loadMetaError.preEmit = (error) ->


module.exports = BrowseAction
