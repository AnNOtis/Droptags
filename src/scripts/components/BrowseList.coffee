React = require('react')
_ = require('lodash')

File = require('./File.coffee')
Directory = require('./Directory.coffee')

BrowseList = React.createClass
  propTypes:
    contents: React.PropTypes.array
    onContentFocus: React.PropTypes.func.isRequired

  getDefaultProps: ->
    contents: []

  getInitialState: ->
    focusedContent: -1

  render: ->
    <ul>
      {
        _.map(this.props.contents, (content, index) =>
          isFocused = (index == this.state.focusedContent)
          if content.is_dir
            <Directory
              order={index}
              info={content}
              isFocused={isFocused}
              onContentFocus={this.focusContent}
              onDoubleClick={this.props.onPathChanged}
            />
          else
            <File
              order={index}
              info={content}
              isFocused={isFocused}
              onContentFocus={this.focusContent}
            />
        )
      }
    </ul>

  focusContent: (order, contentInfo)->
    this.props.onContentFocus(contentInfo)
    this.setState(
      focusedContent: order
    )

module.exports = BrowseList
