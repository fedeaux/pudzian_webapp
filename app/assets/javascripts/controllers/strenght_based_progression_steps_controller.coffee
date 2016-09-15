class StrenghtBasedProgressionStepsController
  constructor: (@scope, @stateParams, @StrenghtBasedProgressionStepsService, @StrenghtBasedProgressionStep) ->
    window.steps_ctrl = @

    @scope.$on 'StrenghtBasedProgression:Publish', @strenghtBasedProgressionPublished
    @scope.$emit 'Steps:Initialized'

  strenghtBasedProgressionPublished: (event, data) =>
    @strenght_based_progression = data.strenght_based_progression
    @exercise_strenght_test = data.exercise_strenght_test
    @service = new @StrenghtBasedProgressionStepsService @strenght_based_progression.id, ->
    @loadStrenghtBasedProgressionSteps()
    @setBlankForm()

  loadStrenghtBasedProgressionSteps: ->
    @steps = {}
    @service.get (response) =>
      @setSteps response.steps

  setSteps: (steps_attributes) ->
    @steps ?= {}

    for step_attributes in steps_attributes
      @steps[step_attributes.id] = @createStep step_attributes

    @updateAuxiliarDataStructures()

  updateAuxiliarDataStructures: ->
    @displayable_steps = (step for id, step of @steps)

  createStep: (attributes) ->
    new @StrenghtBasedProgressionStep attributes,
      strenght_based_progression: @strenght_based_progression
      exercise_strenght_test: @exercise_strenght_test

  setBlankForm: ->
    @form_step = @createStep {}

  cancelEdit: ->
    if @previous_step
      @step = @previous_step
      @previous_step = null

    @clearForm()

  clearForm: ->
    @form_step = null

  stepSaved: (response) ->
    if response.step
      step = @createStep response.step

      @steps[step.id] = step
      @updateAuxiliarDataStructures()
      @setBlankForm()

  save: ->
    if @form_step.isPersisted()
      @service.update @form_step, (response) =>
        @stepSaved response

    else
      @service.create @form_step, (response) =>
        @stepSaved response

  delete: (step) ->
    @service.delete step, (response) =>
      delete @steps[response.step.id]
      @updateAuxiliarDataStructures()

StrenghtBasedProgressionStepsController.$inject = ['$scope', '$stateParams', 'StrenghtBasedProgressionStepsService', 'StrenghtBasedProgressionStep']
angular.module('PudzianApp').controller 'StrenghtBasedProgressionStepsController', StrenghtBasedProgressionStepsController
