Store = require('store')

UserStorage = {
  get: (key) ->
    Store.get(@_userKey + key)
  set: (key, value) ->
    Store.set(@_userKey + key, value)
  remove: () ->
    Store.remove(@_userKey + key)

  _userKey: ->
    if !window['__current_user_key_cache']
      window['__current_user_key_cache'] = Store.get('__current_user_key')

    window['__current_user_key_cache'] + '_'

  currentUser: ->
    @get('info')

  setCurrentUser: (uid, accessToken) ->
    Store.set('__current_user_key', uid)
    @set('info',
      uid: uid
      accessToken: accessToken
    )

  destroyCurrentUser: ->
    window['__current_user_key_cache'] = null
    Store.remove('__current_user_key')
}

module.exports = UserStorage
