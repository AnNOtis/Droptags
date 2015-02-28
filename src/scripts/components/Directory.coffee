React = require('react')

Directory = React.createClass
  propTypes:
    info: React.PropTypes.object.isRequired

  render: ->
    <div onDoubleClick={this._handleDoubleClick}>◇ {this._dirName()}</div>

  _dirName: ->
    (this.props.info.path).replace(/.*\//g, "")

  _handleDoubleClick: ->
    this.props.onDoubleClick(this.props.info.path)

module.exports = Directory
