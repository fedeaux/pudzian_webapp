angular.module('PudzianApp').factory 'ExerciseStrenghtTestService', ($resource, $http, ResourceService) ->
  class ExerciseStrenghtTestService extends ResourceService
    constructor: (errorHandler) ->
      super errorHandler, 'exercise_strenght_test', 'exercise_strenght_tests'

    get: (params, complete) ->
      new @service().$get params, @onServerResponse complete

    onServerResponse: (complete) ->
      (response) ->
        if complete
          complete response
