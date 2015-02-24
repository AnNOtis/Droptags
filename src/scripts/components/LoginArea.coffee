React = require('react')

LoginArea = React.createClass
  getInitialState: ->
    return {}
  render: ->
    <button onClick={this._signin}>登入Dropbox</button>

  _signin: ->
    this.props.onSignedIn()

module.exports = LoginArea
