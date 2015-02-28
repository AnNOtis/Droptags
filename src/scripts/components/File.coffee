React = require('react')

File = React.createClass
  propTypes:
    info: React.PropTypes.object.isRequired

  render: ->
    <div onClick={this._handleFileClick}>
      { if this.props.isFocused then ">" else "|"} -- {this._fileName()}
    </div>

  _fileName: ->
    (this.props.info.path).replace(/.?\//g, "")

  _handleFileClick: ->
    this.props.onContentFocus(this.props.order, this.props.info)

module.exports = File
