angular.module('PudzianApp').factory 'ExerciseCategory', ($resource) ->
  class ExerciseCategory
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
        name: null

      attr

    attributes: ->
      attr = {}

      for name, default_value of @defaultAttributes(true)
        attr[name] = @[name]

      attr
