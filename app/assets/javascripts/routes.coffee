angular.module('PudzianApp').config ($routeProvider, $locationProvider) ->
  $routeProvider.when('/',
    templateUrl: '/templates/devise/sessions/new'
    controller: 'UsersController as user_ctrl'
  ).when('/profile',
    templateUrl: '/templates/users/profile'
    controller: 'UsersController as user_ctrl'
  )

  # .otherwise ->
  #   console.log 'caraio'
  #   redirectTo: '/'
