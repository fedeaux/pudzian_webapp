angular.module('PudzianApp').factory 'StrenghtBasedProgression', ($resource) ->
  class StrenghtBasedProgression
    constructor: (attributes = {}) ->
      @setAttributes attributes

    setAttributes: (attributes, skip_associations = false) ->
      for name, default_value of @defaultAttributes(skip_associations)
        if attributes.hasOwnProperty(name) and attributes[name] != null
          @[name] = attributes[name]
        else
          @[name] = default_value

    isPersisted: ->
      !! @id

    defaultAttributes: (skip_associations = false) ->
      attr =
        id: null
        exercise_id: null
        string_repetitions_signature: null

      unless skip_associations
        attr.repetitions_signature = {}

      attr

    attributes: ->
      attr = {}

      for name, default_value of @defaultAttributes(true)
        attr[name] = @[name]

      attr
