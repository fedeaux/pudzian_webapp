@DateFormats =
  db_day: 'YYYY-MM-DD'
  pretty_day: 'ddd, MMM Do'

PudzianApp = angular.module('PudzianApp', ['ngResource', 'ngRoute'])

init = ->
  angular.bootstrap( $('body'), ['PudzianApp'] )

$(document).on 'page:load', init
$(document).ready init
