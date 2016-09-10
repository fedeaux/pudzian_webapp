angular.module('PudzianApp')
.config ($stateProvider) ->
  $stateProvider.state('login',
    url: ''
    views:
      dashboard:
        templateUrl: '/templates/devise/sessions/new'
        controller: 'UsersController as users_ctrl'

    resolve:
      auth: ($auth, $state) ->
        $auth.validateUser().then( ->
          $state.go 'app.exercises'
        ).catch ->

  ).state('login.with_slaash',
    url: '/'

  ).state('app',
    abstract: true
    template: '<ui-view/>'
    resolve:
      app: ($auth, $state) ->
        $auth.validateUser().catch ->
          $state.go 'login'

    views:
      menu:
        templateUrl: '/templates/menu/index'
  ).state('app.exercises',
    url: '/exercises'
    views:
      'dashboard@':
        templateUrl: '/templates/exercises/index'
        controller: 'ExercisesController as exercises_ctrl'

  ).state('app.exercise',
    url: '/exercises/:id'
    views:
      'dashboard@':
        templateUrl: '/templates/exercises/show'
        controller: 'ExerciseController as exercise_ctrl'

  )
