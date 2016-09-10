@DateFormats =
  db_day: 'YYYY-MM-DD'
  pretty_day: 'ddd, MMM Do'

PudzianApp = angular.module('PudzianApp', ['ngResource', 'ui.router', 'ng-token-auth', 'ui.bootstrap'])
  .config ($authProvider) ->
    $authProvider.configure
      apiUrl: config.api_url
      storage: 'localStorage'

init = ->
  angular.bootstrap( $('body'), ['PudzianApp'] )

$(document).on 'page:load', init
$(document).ready init
