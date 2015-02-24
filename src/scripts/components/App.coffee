React = require('react')
# ACTION
LoginAction = require('../actions/LoginAction.coffee')
# VIEW
Header = require('./Header.coffee')
Footer = require('./Footer.coffee')
LoginArea = require('./LoginArea.coffee')

App = React.createClass
  componentDidMount: ->
    LoginAction.checkAuth()
  render: ->
    <div>
      <Header />
      <LoginArea onSignedIn={this._onSignedIn}/>
      <Footer />
    </div>

  _onSignedIn: ->
    LoginAction.login()

module.exports = App

