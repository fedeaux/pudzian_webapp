class ExerciseController
  constructor: (@scope, @routeParams, @ExerciseService, @Exercise) ->
    window.exercises_ctrl = @

    @service = new @ExerciseService ->
    @loadExercise @routeParams.id

  loadExercise: (exercise_id) ->
    @exercise = {}
    @service.get exercise_id, (exercise_attributes) =>
      console.log exercise_attributes

ExerciseController.$inject = ['$scope', '$routeParams', 'ExerciseService', 'Exercise']
angular.module('PudzianApp').controller 'ExerciseController', ExerciseController
