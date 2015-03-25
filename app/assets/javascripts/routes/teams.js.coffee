App.TeamsRoute = Ember.Route.extend
  model: ->
    @store.findAll 'team'