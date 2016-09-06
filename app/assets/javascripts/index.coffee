@DateFormats =
  db_day: 'YYYY-MM-DD'
  pretty_day: 'ddd, MMM Do'

PudzianApp = angular.module('PudzianApp', ['ngResource', 'ngRoute', 'Devise'])
  .config (AuthProvider) ->
    AuthProvider.loginPath 'http://localhost:3001/auth/sign_in'
    AuthProvider.loginMethod 'POST'
    AuthProvider.resourceName null

init = ->
  angular.bootstrap( $('body'), ['PudzianApp'] )

$(document).on 'page:load', init
$(document).ready init
