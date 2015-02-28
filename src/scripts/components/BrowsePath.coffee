React = require('react')

BrowsePath = React.createClass
  propTypes:
    path: React.PropTypes.string

  getDefaultProps: ->
    path: '/'

  render: ->
    <div>
      <h2>{this.props.path}</h2>
      {
        if this.props.path != "/"
          <span onClick={this._goToParent}>上一層</span>
      }
    </div>

  _goToParent: ->
    this.props.onPathChanged(this._parentPath())

  _parentPath: ->
    parentPathRegex = /.*\//g
    this.props.path.match(parentPathRegex)[0]

module.exports = BrowsePath
