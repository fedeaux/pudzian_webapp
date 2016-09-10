class StrenghtBasedProgressionController
  constructor: (@scope, @stateParams,
                @StrenghtBasedProgressionsService, @StrenghtBasedProgression, @ExerciseStrenghtTest) ->

    window.progression_ctrl = @
    @service = new @StrenghtBasedProgressionsService ->
    @strenght_based_progression_id = @stateParams.id
    @loadStrenghtBasedProgression()

  loadStrenghtBasedProgression: ->
    @service.get id: @strenght_based_progression_id, (response) =>
      @strenght_based_progression = new @StrenghtBasedProgression response.strenght_based_progression
      @exercise_strenght_test = new @ExerciseStrenghtTest response.strenght_based_progression.exercise_strenght_test
      @strenght_level = 1

      @base_maximum_weight = Math.max.apply null, ( pair[1] for pair in @strenght_based_progression.repetitions_with_weights )

      @setMutableRepetitionsWithWeights()

  setMutableRepetitionsWithWeights: ->
    @mutable_repetitions_with_weights = []
    for index, pair of @strenght_based_progression.repetitions_with_weights
      new_weight = Math.round( pair[1] * @strenght_level / @exercise_strenght_test.precision ) *
        @exercise_strenght_test.precision

      @mutable_repetitions_with_weights[index] = [ pair[0], new_weight ]
      @changed_maximum_weight = Math.max.apply null, ( pair[1] for pair in @mutable_repetitions_with_weights )

  increaseStrenghtLevel: ->
    @strenght_level = ( @changed_maximum_weight + @exercise_strenght_test.precision ) / @base_maximum_weight
    @setMutableRepetitionsWithWeights()

  decreaseStrenghtLevel: ->
    @strenght_level = Math.max 0.5, ( @changed_maximum_weight - @exercise_strenght_test.precision ) / @base_maximum_weight
    @setMutableRepetitionsWithWeights()

StrenghtBasedProgressionController.$inject = ['$scope', '$stateParams',
  'StrenghtBasedProgressionsService', 'StrenghtBasedProgression', 'ExerciseStrenghtTest']

angular.module('PudzianApp').controller 'StrenghtBasedProgressionController', StrenghtBasedProgressionController
