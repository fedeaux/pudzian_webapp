class UsersController
  constructor: (@scope, @state, @auth) -> #, @ResourceService, @User
    @credentials = {
      email: 'phec06@gmail.com',
      password: 'senhanova123'
    }

  login: ->
    @auth.submitLogin(@credentials).then((user) =>
      @state.go 'auth.exercises'
    ).catch (error) ->
      console.log error

UsersController.$inject = ['$scope', '$state', '$auth']
angular.module('PudzianApp').controller 'UsersController', UsersController
