Store = require('store')

UserStorage = {
  get: (key) ->
    return unless @_userKey
    Store.get(@_userKey + key)
  set: (key, value) ->
    return unless @_userKey
    Store.set(@_userKey + key, value)
  remove: () ->
    return unless @_userKey
    Store.remove(@_userKey + key)

  _userKey: ->
    key = Store.get('__current_user_key')

  currentUser: ->
    if not Store.get('__current_user_key')
      return null
    @get('info')

  setCurrentUser: (uid, accessToken) ->
    Store.set('__current_user_key', uid)
    @set('info',
      uid: uid
      accessToken: accessToken
    )

  destroyCurrentUser: ->
    Store.remove('__current_user_key')
}

module.exports = UserStorage
