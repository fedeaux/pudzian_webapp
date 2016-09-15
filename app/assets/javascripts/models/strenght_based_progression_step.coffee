angular.module('PudzianApp').factory 'StrenghtBasedProgressionStep', ($resource) ->
  class StrenghtBasedProgressionStep
    constructor: (attributes = {}, @auxiliarModels) ->
      @setAttributes attributes
      @parseDateAttributes()
      @setAuxiliarAttributes()

    setAttributes: (attributes, skip_associations = false) ->
      for name, default_value of @defaultAttributes(skip_associations)
        if attributes.hasOwnProperty(name) and attributes[name] != null
          @[name] = attributes[name]
        else
          @[name] = default_value

    parseDateAttributes: ->
      if @done_at
        @done_at = moment @done_at

    setAuxiliarAttributes: ->
      @base_maximum_weight = Math.max.apply null, (
        pair[1] for pair in @auxiliarModels.strenght_based_progression.repetitions_with_weights
      )

      @setNewPlannedSet()

      if moment().diff(@done_at, 'days') < 1
        @done_today = true

    setNewPlannedSet: ->
      @new_planned_set = []
      for index, pair of @auxiliarModels.strenght_based_progression.repetitions_with_weights
        new_weight = Math.round( pair[1] * @strenght_level / @auxiliarModels.exercise_strenght_test.precision ) *
          @auxiliarModels.exercise_strenght_test.precision

        @new_planned_set[index] = [ pair[0], new_weight ]
        @planned_set_maximum_weight = Math.max.apply null, ( pair[1] for pair in @new_planned_set )

    increaseStrenghtLevel: ->
      @strenght_level = ( @planned_set_maximum_weight + @auxiliarModels.exercise_strenght_test.precision ) / @base_maximum_weight
      @setNewPlannedSet()

    decreaseStrenghtLevel: ->
      @strenght_level = Math.max 0.5,
        ( @planned_set_maximum_weight - @auxiliarModels.exercise_strenght_test.precision ) / @base_maximum_weight

      @setNewPlannedSet()

    isPersisted: ->
      !! @id

    defaultAttributes: (skip_associations = false) ->
      attr =
        id: null
        done_at: null
        done_set: null
        planned_set: null
        strenght_level: 1.0

      attr

    displayableNewPlannedSet: ->
      ("#{pair[0]} x #{pair[1]}#{@auxiliarModels.exercise_strenght_test.unit}" for pair in @new_planned_set).join ' / '

    attributes: ->
      attr = {}

      for name, default_value of @defaultAttributes(true)
        attr[name] = @[name]

      attr.planned_set = @displayableNewPlannedSet()

      attr
