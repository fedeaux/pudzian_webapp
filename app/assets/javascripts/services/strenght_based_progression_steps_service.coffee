angular.module('PudzianApp').factory 'StrenghtBasedProgressionStepsService', ($resource, $http, ResourceService) ->
  class StrenghtBasedProgressionStepsService extends ResourceService
    constructor: (@strenght_based_progression_id, errorHandler) ->
      super errorHandler, 'strenght_based_progression_step',
        'strenght_based_progression_steps',
        "strenght_based_progressions/#{@strenght_based_progression_id}/strenght_based_progression_steps/:id"

    get: (params, complete) ->
      new @service().$get params, @onServerResponse complete

    onServerResponse: (complete) ->
      (response) ->
        if complete
          complete response
