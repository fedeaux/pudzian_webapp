class ExerciseStrenghtTestController
  constructor: (@scope, @rootScope, @timeout, @stateParams,
                @ExerciseStrenghtTestService, @ExerciseStrenghtTest) ->

    window.strenght_ctrl = @
    @service = new @ExerciseStrenghtTestService ->
    @exercise_id = @stateParams.id

    @loadExerciseStrenghtTest()

  loadExerciseStrenghtTest: (exercise_id) ->
    @exercise_strenght_test = null
    @service.get exercise_id: @exercise_id, (response) =>
      @setExerciseStrenghtTest response.exercise_strenght_test

  setForm: ->
    @previous_exercise_strenght_test = angular.copy @exercise_strenght_test
    @form_exercise_strenght_test = @exercise_strenght_test

  cancelEdit: ->
    if @previous_exercise_strenght_test
      @exercise_strenght_test = @previous_exercise_strenght_test
      @previous_exercise_strenght_test = null

    @clearForm()

  clearForm: ->
    @form_exercise_strenght_test = null

  setExerciseStrenghtTest: (exercise_strenght_test_attributes) ->
    @exercise_strenght_test = new @ExerciseStrenghtTest exercise_strenght_test_attributes

    if @exercise_strenght_test.isPersisted()
      @rootScope.$broadcast 'ExerciseStrenghtTestController:ExerciseStrenghtTestCreated'

  save: ->
    if @form_exercise_strenght_test.isPersisted()
      @service.update @form_exercise_strenght_test, (response) =>
        @setExerciseStrenghtTest response.exercise_strenght_test
        @clearForm()

    else
      @service.create @form_exercise_strenght_test, (response) =>
        @setExerciseStrenghtTest response.exercise_strenght_test
        @clearForm()

ExerciseStrenghtTestController.$inject = ['$scope', '$rootScope', '$timeout', '$stateParams',
  'ExerciseStrenghtTestService', 'ExerciseStrenghtTest']

angular.module('PudzianApp').controller 'ExerciseStrenghtTestController', ExerciseStrenghtTestController
