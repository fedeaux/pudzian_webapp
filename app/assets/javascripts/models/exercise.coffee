angular.module('PudzianApp').factory 'Exercise', ($resource) ->
  class Exercise
    constructor: (attributes = {}) ->
      @setAttributes attributes

    setAttributes: (attributes, update = false) ->
      for name, default_value of @defaultAttributes(update)
        if attributes.hasOwnProperty(name) and attributes[name] != null
          @[name] = attributes[name]
        else
          @[name] = default_value

    isPersisted: ->
      !! @id

    defaultAttributes: (update) ->
      attr =
        id: null
        name: null

      attr

    attributes: ->
      attr = {}

      for name, default_value of @defaultAttributes(true)
        attr[name] = @[name]

      attr
