angular.module('PudzianApp')
.config ($stateProvider) ->
  $stateProvider.state('login',
    url: '/'
    templateUrl: '/templates/devise/sessions/new'
    controller: 'UsersController as users_ctrl'

  ).state('auth',
    abstract: true
    template: '<ui-view/>'
    resolve:
      auth: ($auth) ->
        $auth.validateUser()

  ).state('auth.exercises',
    url: '/exercises'
    templateUrl: '/templates/exercises/index'
    controller: 'ExercisesController as exercises_ctrl'

  ).state('auth.exercise',
    url: '/exercises/:id'
    templateUrl: '/templates/exercises/show'
    controller: 'ExerciseController as exercise_ctrl'
  )

# .config ($routeProvider, $locationProvider) ->
#   $routeProvider.when('/',
#     templateUrl: '/templates/devise/sessions/new'
#     controller: 'UsersController as users_ctrl'
#   ).when('/profile',
#     templateUrl: '/templates/users/profile'
#     controller: 'UsersController as users_ctrl'
#   ).when('/exercises',
#     templateUrl: '/templates/exercises/index'
#     controller: 'ExercisesController as exercises_ctrl'
#   ).when('/exercises/:id',
#     templateUrl: '/templates/exercises/show'
#     controller: 'ExerciseController as exercise_ctrl'
#   )

#   # .otherwise ->
#   #   console.log 'caraio'
#   #   redirectTo: '/'
