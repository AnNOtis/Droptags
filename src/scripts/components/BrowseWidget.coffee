React = require('react')

ResourceStore = require('../stores/ResourceStore.coffee')

BrowseAction = require('../actions/BrowseAction.coffee')

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
    }

  componentDidMount: ->
    BrowseAction.loadMeta(this.state.path)
    ResourceStore.listen(this._onMetaChanged)

  render: ->
    <div>
      <BrowsePath path={this.state.path} onPathChanged={this._onPathChanged}/>
      <BrowseList
        contents={this.state.contents}
        onContentFocus={this._onContentFocused}
        onPathChanged={this._onPathChanged}
      />
      <BrowseDetail content={this.state.currentFocusContent} />
    </div>

  _onPathChanged: (path) ->
    BrowseAction.loadMeta(path)

  _onMetaChanged: ->
    meta = getCurrentMeta()
    meta.contents ||= []
    this.setState(meta)

  _onContentFocused: (content)->
    this.setState(currentFocusContent: content)

module.exports = BrowseWidget
