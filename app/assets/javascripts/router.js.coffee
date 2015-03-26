# For more information see: http://emberjs.com/guides/routing/

App.Router.map ()->
  @resource 'teams', ()->
    @resource 'team', { path: ':id'}, ()->
      @resource 'players'
      @route 'new'
      @route 'edit'
  @route 'player', { path: 'player/:id' }

