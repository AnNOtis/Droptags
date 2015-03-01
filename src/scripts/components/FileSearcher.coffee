require('../../assets/stylesheets/components/FileSearcher.sass')

React = require('react')

FileSearcher = React.createClass

  render: ->
    <div className='FileSearcher'>
      <input className='FileSearcher-input'/>
    </div>

module.exports = FileSearcher

