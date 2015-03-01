require('../../assets/stylesheets/components/File.sass')

React = require('react/addons')
cx = React.addons.classSet

File = React.createClass
  propTypes:
    info: React.PropTypes.object.isRequired

  render: ->
    fileClasses = cx(
      'File': true
      'is-focus': this.props.isFocused
    )

    <div
      className={fileClasses}
      onClick={this._handleFileClick}>
      <a className='File-name'>
        {this._fileName()}
      </a>
    </div>

  _fileName: ->
    (this.props.info.path).replace(/.?\//g, "")

  _handleFileClick: ->
    this.props.onContentFocus(this.props.order, this.props.info)

module.exports = File
