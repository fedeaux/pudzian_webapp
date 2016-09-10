angular.module('PudzianApp').factory 'ExerciseStrenghtTest', ($resource) ->
  class ExerciseStrenghtTest
    constructor: (attributes = {}) ->
      @setAttributes attributes

    setAttributes: (attributes, skip_associations = false) ->
      for name, default_value of @defaultAttributes(skip_associations)
        if attributes.hasOwnProperty(name) and attributes[name] != null
          @[name] = attributes[name]
        else
          @[name] = default_value

      @parseNumbers()

    isPersisted: ->
      !! @id

    defaultAttributes: (skip_associations = false) ->
      attr =
        id: null
        exercise_id: null
        mr_weights: null
        precision: null
        unit: null

      attr

    parseNumbers: ->
      @precision = parseFloat @precision

    attributes: ->
      attr = {}

      for name, default_value of @defaultAttributes(true)
        attr[name] = @[name]

      attr
