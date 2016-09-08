@DateFormats =
  db_day: 'YYYY-MM-DD'
  pretty_day: 'ddd, MMM Do'

PudzianApp = angular.module('PudzianApp', ['ngResource', 'ui.router', 'ng-token-auth'])
  .config ($authProvider) ->
    $authProvider.configure
      apiUrl: 'http://localhost:3001/'
      storage: 'localStorage'

init = ->
  angular.bootstrap( $('body'), ['PudzianApp'] )

$(document).on 'page:load', init
$(document).ready init
