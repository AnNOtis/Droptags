require('../../assets/stylesheets/components/BrowseWidget.sass')

React = require('react')

ResourceStore = require('../stores/ResourceStore.coffee')

BrowseAction = require('../actions/BrowseAction.coffee')

FileSearcher = require('./FileSearcher.coffee')
BrowsePath = require('./BrowsePath.coffee')
BrowseList = require('./BrowseList.coffee')
BrowseDetail = require('./BrowseDetail.coffee')

getCurrentMeta = ->
  ResourceStore.currentMeta()

BrowseWidget = React.createClass
  getInitialState: ->
    {
      path: '/'
      currentFocusContent: null
      focusedContent: -1
    }

  componentDidMount: ->
    BrowseAction.loadMeta(this.state.path)
    ResourceStore.listen(this._onMetaChanged)

  render: ->
    <div className='BrowseWidget'>
      <FileSearcher />
      <div className='FileBrowser'>
        <BrowsePath path={this.state.path} onPathChanged={this._onPathChanged}/>
        <BrowseList
          contents={this.state.contents}
          onContentFocus={this._onContentFocused}
          onPathChanged={this._onPathChanged}
          focusedContent={this.state.focusedContent}
        />
        <BrowseDetail content={this.state.currentFocusContent} />
      </div>
    </div>

  _onPathChanged: (path) ->
    BrowseAction.loadMeta(path)

  _onMetaChanged: ->
    meta = getCurrentMeta()
    meta.contents ||= []
    this.setState(
      _.assign(meta,
        currentFocusContent: null
        focusedContent: -1
      )
    )

  _onContentFocused: (order, content)->
    this.setState(
      currentFocusContent: content
      focusedContent: order
    )

module.exports = BrowseWidget
