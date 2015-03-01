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
    Reflux.listenTo(LoginStore, '_onLoginStatusChanged'),
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
      <div className='container'>
        {
          if @state.user
            <BrowseWidget />
          else
            <LoginArea onSignedIn={@_signedIn}/>
        }
      </div>
      <Footer />
    </div>

  _signedIn: ->
    LoginAction.login()

  _logout: ->
    LoginAction.logout()

  _onLoginStatusChanged: ->
    this.setState(
      user: LoginStore.currentUser()
    )

module.exports = App

