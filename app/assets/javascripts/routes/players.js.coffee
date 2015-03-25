App.PlayerRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'player', params.player_id
