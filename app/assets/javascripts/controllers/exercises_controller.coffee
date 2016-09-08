class ExercisesController
  constructor: (@scope, @location, @ExerciseService, @Exercise) ->
    window.exercises_ctrl = @

    @service = new @ExerciseService ->
    @loadExercises()

    @filter = ''

  loadExercises: ->
    @exercises = {}
    @service.index (exercises_attributes) =>
      for exercise_attributes in exercises_attributes
        @exercises[exercise_attributes['id']] = new @Exercise exercise_attributes

      @updateAuxiliarDataStructures()

  matchFilter: (exercise) ->
    if @filter == ''
      return true

    exercise.name.toLowerCase().indexOf(@filter.toLowerCase()) > -1

  updateAuxiliarDataStructures: ->
    @displayable_exercises = ( exercise for id, exercise of @exercises ).sort (a, b) ->
      if a.name < b.name then -1 else 1

ExercisesController.$inject = ['$scope', '$location', 'ExerciseService', 'Exercise']
angular.module('PudzianApp').controller 'ExercisesController', ExercisesController
