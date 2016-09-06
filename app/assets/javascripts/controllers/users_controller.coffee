class UsersController
  constructor: (@scope) -> #, @ResourceService, @User

UsersController.$inject = ['$scope'] #, 'ResourceService', 'User'
angular.module('PudzianApp').controller 'UsersController', UsersController
