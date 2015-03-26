App.TeamRoute = Ember.Route.extend
  model: (params) ->
    @store.findAll 'team', params.id