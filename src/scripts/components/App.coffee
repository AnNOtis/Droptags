React = require('react')
Reflux = require('reflux')

# STORE
LoginStore = require('../stores/LoginStore.coffee')

# ACTION
LoginAction = require('../actions/LoginAction.coffee')

# COMPONENT
Header = require('./Header.coffee')
Footer = require('./Footer.coffee')
LoginArea = require('./LoginArea.coffee')
BrowseWidget = require('./BrowseWidget.coffee')

App = React.createClass
  mixins: [
    Reflux.listenTo(LoginStore, 'onSuccessAuth'),
    Reflux.listenTo(LoginStore, 'onLogout')
  ]

  getInitialState: ->
    {
      user: LoginStore.currentUser()
    }

  componentDidMount: ->
    LoginAction.checkAuth()

  render: ->
    <div>
      <Header user={@state.user} onLogout={@_logout}/>
      { <LoginArea onSignedIn={@_signedIn}/> unless @state.user}
      <BrowseWidget />
      <Footer />
    </div>

  _signedIn: ->
    LoginAction.login()

  _logout: ->
    LoginAction.logout()

  onSuccessAuth: ->
    @setState(
      user: LoginStore.currentUser()
    )

  onLogout: ->
    @setState(
      user: LoginStore.currentUser()
    )

module.exports = App

