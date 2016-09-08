class ExerciseController
  constructor: (@scope, @stateParams, @ExerciseService, @Exercise) ->
    window.exercises_ctrl = @

    @service = new @ExerciseService ->
    @loadExercise @stateParams.id

  loadExercise: (exercise_id) ->
    @exercise = {}
    @service.get exercise_id, (exercise_attributes) =>
      console.log exercise_attributes

ExerciseController.$inject = ['$scope', '$stateParams', 'ExerciseService', 'Exercise']
angular.module('PudzianApp').controller 'ExerciseController', ExerciseController
