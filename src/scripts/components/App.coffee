React = require('react')
Reflux = require('reflux')

# STORE
LoginStore = require('../stores/LoginStore.coffee')

# ACTION
LoginAction = require('../actions/LoginAction.coffee')

# VIEW
Header = require('./Header.coffee')
Footer = require('./Footer.coffee')
LoginArea = require('./LoginArea.coffee')

App = React.createClass
  mixins: [
    Reflux.listenTo(LoginStore, 'onSuccessAuth')
  ]

  getInitialState: ->
    {
      user: LoginStore.currentUser()
    }

  componentDidMount: ->
    LoginAction.checkAuth()

  render: ->
    <div>
      <Header user={@state.user}/>
      { <LoginArea onSignedIn={@_onSignedIn}/> unless @state.user}
      <Footer />
    </div>

  _onSignedIn: ->
    LoginAction.login()

  onSuccessAuth: ->
    @setState(
      user: LoginStore.currentUser()
    )

module.exports = App

