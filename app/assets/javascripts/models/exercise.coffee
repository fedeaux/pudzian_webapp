angular.module('PudzianApp').factory 'Exercise', ($resource, ExerciseCategory) ->
  class Exercise
    constructor: (attributes = {}) ->
      @setAttributes attributes

    setAttributes: (attributes, skip_associations = false) ->
      for name, default_value of @defaultAttributes(skip_associations)
        if attributes.hasOwnProperty(name) and attributes[name] != null
          @[name] = attributes[name]
        else
          @[name] = default_value

      @parseAssociations()

    isPersisted: ->
      !! @id

    defaultAttributes: (skip_associations = false) ->
      attr =
        id: null
        name: null

      unless skip_associations
        attr.categories = []

      attr

    parseAssociations: ->
      if @categories.length > 0 and @categories[0]
        @categories = (new ExerciseCategory(category) for category in @categories)

    attributes: ->
      attr = {}

      for name, default_value of @defaultAttributes(true)
        attr[name] = @[name]

      attr
