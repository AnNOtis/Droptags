React = require('react')

Header = React.createClass
  render: ->
    <div>
      <strong>DropTags | </strong>
      {
        if this.props.user
          <span>
            <span>{this.props.user.uid}</span>
            <button onClick={this.props.onLogout}>sign out</button>
          </span>
      }
    </div>


module.exports = Header
