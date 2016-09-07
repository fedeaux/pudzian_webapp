angular.module('PudzianApp').config ($routeProvider, $locationProvider) ->
  $routeProvider.when('/',
    templateUrl: '/templates/devise/sessions/new'
    controller: 'UsersController as users_ctrl'
  ).when('/profile',
    templateUrl: '/templates/users/profile'
    controller: 'UsersController as users_ctrl'
  ).when('/exercises',
    templateUrl: '/templates/exercises/index'
    controller: 'ExercisesController as exercises_ctrl'
  ).when('/exercises/:id',
    templateUrl: '/templates/exercises/show'
    controller: 'ExerciseController as exercise_ctrl'
  )

  # .otherwise ->
  #   console.log 'caraio'
  #   redirectTo: '/'
