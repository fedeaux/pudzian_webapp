class ExercisesController
  constructor: (@scope, @location, @ExerciseService, @Exercise) ->
    window.exercises_ctrl = @

    @service = new @ExerciseService ->
    @loadExercises()

    @filter = ''

  loadExercises: ->
    @exercises = {}
    @service.index (exercises_attributes, categories_attributes) =>
      for exercise_attributes in exercises_attributes
        @exercises[exercise_attributes['id']] = new @Exercise exercise_attributes

      @updateAuxiliarDataStructures()

  matchFilter: (exercise) ->
    if @filter == ''
      return true

    parts = @filter.toLowerCase().replace(/\s+/, ' ').split ' '

    for part in @filter.toLowerCase().split ' '
      if exercise.matchable_string.indexOf(part) == -1
        return false

    true

  onFilter: (string) ->
    @filter.indexOf(string) > -1

  resetFilter: ->
    @filter = ""

  addToFilter: (string) ->
    @filter += ' '+string

  removeFromFilter: (string) ->
    @filter = @filter.replace(string, '').replace(/\s+/, ' ').replace(/^\s|\s$/, '')

  toggleOnFilter: (string) ->
    if @onFilter string
      @removeFromFilter string
    else
      @addToFilter string

  updateAuxiliarDataStructures: ->
    @displayable_exercises = []
    categories = {}

    for id, exercise of @exercises
      @displayable_exercises.push exercise

      # Avoiding duplication
      for category in exercise.categories
        categories[category.name] = category.name

    @displayable_exercises = @displayable_exercises.sort (a, b) ->
      if a.name < b.name then -1 else 1

    @categories = (category_name for _, category_name of categories).sort (a, b) ->
      if a < b then -1 else 1

ExercisesController.$inject = ['$scope', '$location', 'ExerciseService', 'Exercise']
angular.module('PudzianApp').controller 'ExercisesController', ExercisesController
