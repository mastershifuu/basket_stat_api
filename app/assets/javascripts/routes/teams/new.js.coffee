App.TeamsNewRoute = Ember.Route.extend
  model: () ->
    @store.createRecord 'team', {}
  actions:
    willTransition: (transition) ->
      # delete unsaved record on press back button or link in NavBar
      if transition.targetName != 'teams.show'
        @currentModel.deleteRecord()
