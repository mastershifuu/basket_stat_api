App.TeamsShowRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'team', params.team_id