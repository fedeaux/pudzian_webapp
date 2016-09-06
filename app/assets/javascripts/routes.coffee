angular.module('PudzianApp').config ($routeProvider, $locationProvider) ->
  $routeProvider.when('/',
    templateUrl: '/templates/devise/sessions/new'
    controller: 'UsersController'
  ).when('/profile',
    templateUrl: '/templates/users/profile'
    controller: 'UsersController'
  )

  # .otherwise ->
  #   console.log 'caraio'
  #   redirectTo: '/'
