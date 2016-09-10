class StrenghtBasedProgressionController
  constructor: (@scope, @stateParams, @StrenghtBasedProgressionsService, @StrenghtBasedProgression) ->
    window.progression_ctrl = @
    @service = new @StrenghtBasedProgressionsService ->
    @strenght_based_progression_id = @stateParams.id
    @loadStrenghtBasedProgression()

  loadStrenghtBasedProgression: ->
    @service.get id: @strenght_based_progression_id, (response) =>
      @strenght_based_progression = new @StrenghtBasedProgression response.strenght_based_progression

  setBlankForm: ->
    @form_strenght_based_progression = new @StrenghtBasedProgression

  cancelEdit: ->
    if @previous_strenght_based_progression
      @strenght_based_progression = @previous_strenght_based_progression
      @previous_strenght_based_progression = null

    @clearForm()

  clearForm: ->
    @form_strenght_based_progression = null

  save: ->
    @service.update @form_strenght_based_progression, (response) =>
      @strenghtBasedProgressionSaved response

StrenghtBasedProgressionController.$inject = ['$scope', '$stateParams', 'StrenghtBasedProgressionsService', 'StrenghtBasedProgression']
angular.module('PudzianApp').controller 'StrenghtBasedProgressionController', StrenghtBasedProgressionController
