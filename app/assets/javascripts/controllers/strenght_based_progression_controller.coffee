class StrenghtBasedProgressionController
  constructor: (@scope, @stateParams,
                @StrenghtBasedProgressionsService, @StrenghtBasedProgression, @ExerciseStrenghtTest) ->

    window.progression_ctrl = @
    @strenght_based_progression_id = @stateParams.id
    @service = new @StrenghtBasedProgressionsService ->
    @loadStrenghtBasedProgression()

    @scope.$on 'Steps:Initialized', =>
      if @strenght_based_progression
        @publishStrenghtBasedProgression()
      else
        @published = 'delayed'

  publishStrenghtBasedProgression: ->
    unless @published == 'published'
      @published = 'published'
      @scope.$broadcast 'StrenghtBasedProgression:Publish',
        strenght_based_progression: @strenght_based_progression
        exercise_strenght_test: @exercise_strenght_test

  loadStrenghtBasedProgression: ->
    @service.get id: @strenght_based_progression_id, (response) =>
      @strenght_based_progression = new @StrenghtBasedProgression response.strenght_based_progression
      @exercise_strenght_test = new @ExerciseStrenghtTest response.strenght_based_progression.exercise_strenght_test

      if @published == 'delayed'
        @publishStrenghtBasedProgression()

StrenghtBasedProgressionController.$inject = ['$scope', '$stateParams',
  'StrenghtBasedProgressionsService', 'StrenghtBasedProgression', 'ExerciseStrenghtTest']

angular.module('PudzianApp').controller 'StrenghtBasedProgressionController', StrenghtBasedProgressionController
