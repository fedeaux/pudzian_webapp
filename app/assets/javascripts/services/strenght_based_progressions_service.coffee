angular.module('PudzianApp').factory 'StrenghtBasedProgressionsService', ($resource, $http, ResourceService) ->
  class ExerciseStrenghtTestService extends ResourceService
    constructor: (errorHandler) ->
      super errorHandler, 'strenght_based_progression', 'strenght_based_progressions'

    get: (params, complete) ->
      new @service().$get params, @onServerResponse complete

    onServerResponse: (complete) ->
      (response) ->
        if complete
          complete response
