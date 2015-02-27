React = require('react')

BrowsePath = require('./BrowsePath.coffee')
BrowseList = require('./BrowseList.coffee')

BrowseWidget = React.createClass
  render: ->
    <div>
      <BrowsePath />
      <BrowseList />
    </div>

module.exports = BrowseWidget
