class UsersController
  constructor: (@scope, @state, @auth, @timeout) ->
    @credentials = {
      email: 'phec06@gmail.com',
      password: 'senhanova123'
    }

  login: ->
    @auth.submitLogin(@credentials).then((user) =>
      @state.go 'app.exercises'
    ).catch (error) ->
      console.log error

  logout: ->
    @auth.signOut().then( =>
      @timeout =>
        @state.go 'login'
    )

UsersController.$inject = ['$scope', '$state', '$auth', '$timeout']
angular.module('PudzianApp').controller 'UsersController', UsersController
