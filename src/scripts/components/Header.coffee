require('../../assets/stylesheets/components/Header.sass')

React = require('react')

Header = React.createClass
  render: ->
    <header>
      <div className='container'>
        <h1 className='Header-logo'>DropTags</h1>
        {
          if this.props.user
            <nav>
              <span>{this.props.user.uid}</span>
              <button onClick={this.props.onLogout}>sign out</button>
            </nav>
        }
      </div>
    </header>


module.exports = Header
