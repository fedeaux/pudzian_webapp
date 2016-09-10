class StrenghtBasedProgressionsController
  constructor: (@scope, @stateParams, @StrenghtBasedProgressionService, @StrenghtBasedProgression) ->
    window.progressions_ctrl = @
    @service = new @StrenghtBasedProgressionService ->
    @exercise_id = @stateParams.id
    @loadStrenghtBasedProgressions()

    @scope.$on 'ExerciseStrenghtTestController:ExerciseStrenghtTestCreated', =>
      @exercise_has_strenght_test = true

  loadStrenghtBasedProgressions: ->
    @strenght_based_progressions = {}
    @service.get exercise_id: @exercise_id, (response) =>
      @setStrenghtBasedProgressions response.strenght_based_progressions
      @exercise_has_strenght_test = response.exercise_has_strenght_test

  setStrenghtBasedProgressions: (strenght_based_progressions_attributes) ->
    @strenght_based_progressions ?= {}

    for strenght_based_progression_attributes in strenght_based_progressions_attributes
      @strenght_based_progressions[strenght_based_progression_attributes.id] =
        new @StrenghtBasedProgression strenght_based_progression_attributes

    @updateAuxiliarDataStructures()

  updateAuxiliarDataStructures: ->
    @displayable_strenght_based_progressions =
      (strenght_based_progression for id, strenght_based_progression of @strenght_based_progressions)

  setBlankForm: ->
    @form_strenght_based_progression = new @StrenghtBasedProgression

  cancelEdit: ->
    if @previous_strenght_based_progression
      @strenght_based_progression = @previous_strenght_based_progression
      @previous_strenght_based_progression = null

    @clearForm()

  clearForm: ->
    @form_strenght_based_progression = null

  # setForm: ->
  #   @previous_strenght_based_progression = angular.copy @strenght_based_progression
  #   @form_strenght_based_progression = @strenght_based_progression

  strenghtBasedProgressionSaved: (response) ->
    if response.strenght_based_progression
      strenght_based_progression = new @StrenghtBasedProgression response.strenght_based_progression
      @strenght_based_progressions[strenght_based_progression.id] = strenght_based_progression
      @updateAuxiliarDataStructures()
      @clearForm()

  save: ->
    @form_strenght_based_progression.exercise_id = @exercise_id

    if @form_strenght_based_progression.isPersisted()
      @service.update @form_strenght_based_progression, (response) =>
        @strenghtBasedProgressionSaved response

    else
      @service.create @form_strenght_based_progression, (response) =>
        @strenghtBasedProgressionSaved response

StrenghtBasedProgressionsController.$inject = ['$scope', '$stateParams', 'StrenghtBasedProgressionsService', 'StrenghtBasedProgression']
angular.module('PudzianApp').controller 'StrenghtBasedProgressionsController', StrenghtBasedProgressionsController
