React = require('react')

Header = React.createClass
  render: ->
    <div>
      <span>DropTags</span>
      {
        if this.props.user
          <span>{this.props.user.uid}</span>
          <button>sign out</button>
      }
    </div>

module.exports = Header
