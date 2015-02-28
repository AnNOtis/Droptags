Reflux = require('reflux')

DROPBOX_AUTH_URL = 'https://www.dropbox.com/1/oauth2/authorize'
DROPBOX_AUTH_TYPE = 'token'
DROPBOX_CLIENT_ID = '7vieboqxmhl45mg'
DROPBOX_REDIRECT_URI = 'http://localhost:8080'

DROPBOX_AUTH_POPUP_WINDOW_REF = '_DROPBOX_AUTH_POPUP_WINDOW'
LoginAction = Reflux.createActions([
  'login',
  'logout',
  'successAuth',
  'checkAuth'
])

# Click login button, start login
LoginAction.login.preEmit = ->
  auth_url = "#{DROPBOX_AUTH_URL}?response_type=#{DROPBOX_AUTH_TYPE}&client_id=#{DROPBOX_CLIENT_ID}&redirect_uri=#{DROPBOX_REDIRECT_URI}"
  windowRef = null
  if(windowRef == null || windowRef.closed)
    window.open(auth_url, DROPBOX_AUTH_POPUP_WINDOW_REF, 'dialog,scrollbars,height=500,width=600')
  else
    windowRef.focus()

  window.addEventListener 'message', (message) ->
    data = message.data
    LoginAction.successAuth(data.uid, data.accessToken)
  ,false

LoginAction.successAuth.preEmit = (uid, accessToken) ->
  console.log "#{uid}, #{accessToken}"

# Popup window for dropbox authorization check if get auth hash
LoginAction.checkAuth.preEmit = (data) ->
  currentUrl = window.location
  authParams = currentUrl.hash
  authRegex = /#access_token=([^&]+).+uid=([\d]+)/
  regexResult = authParams.match(authRegex)

  if(window.opener || window.parent && regexResult)
    window.opener.postMessage(
      accessToken: regexResult[1]
      uid: regexResult[2]
    , DROPBOX_REDIRECT_URI)
    window.close()

module.exports = LoginAction
