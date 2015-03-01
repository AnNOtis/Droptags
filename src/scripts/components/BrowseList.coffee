require('../../assets/stylesheets/components/BrowseList.sass')

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
    {}

  render: ->
    <div className='BrowseList'>
      <ul>
        {
          _.map(this.props.contents, (content, index) =>
            isFocused = (index == this.props.focusedContent)
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
    </div>

  focusContent: (order, contentInfo)->
    this.props.onContentFocus(order, contentInfo)

module.exports = BrowseList
