angular.module('PudzianApp').factory 'ExerciseService', ($resource, $http) ->
  class ExerciseService
    constructor: (@errorHandler) ->
      @service = $resource("http://localhost:3001/exercises/:id", {}, {
       'update': { method: 'PUT'}
      })

    index: (complete) ->
      new @service().$get (data) ->
        complete data['exercises'] if complete

    get: (model_id, complete) ->
      new @service().$get id: model_id, (data) ->
        complete data['exercise'] if complete

    onServerResponse: (complete) ->
      (response) ->
        if complete
          complete response
