class UsersController
  constructor: (@scope, @location, @Auth) -> #, @ResourceService, @User
    @credentials = {
      email: null,
      password: null
    }

    @scope.$on 'devise:login', (event, currentUser) =>

    @scope.$on 'devise:new-session', (event, currentUser) =>
      # user logged in by Auth.login({...})

  login: ->
    @Auth.login(@credentials, {}).then ((user) =>
      @location.path '/exercises'
    ), (error) ->

UsersController.$inject = ['$scope', '$location', 'Auth']
angular.module('PudzianApp').controller 'UsersController', UsersController
