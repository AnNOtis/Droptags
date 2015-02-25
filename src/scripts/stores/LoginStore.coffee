Reflux = require('reflux')
LoginActions = require('../actions/LoginAction.coffee')
UserStorage = require('../utils/UserStorage.coffee')

LoginStore = Reflux.createStore(
  listenables: LoginActions

  init: ->
    currentUser = UserStorage.currentUser

  successAuth: (uid, accessToken) ->
    UserStorage.setCurrentUser(uid, accessToken)
    this.trigger()

  logout: ->
    UserStorage.destroyCurrentUser()
    this.trigger()

  currentUser: ->
    UserStorage.currentUser()
)

module.exports = LoginStore
