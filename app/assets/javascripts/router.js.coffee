# For more information see: http://emberjs.com/guides/routing/

App.Router.map ()->
  @resource 'teams', () ->
    @route 'show', { path: ':team_id'}
    @route 'new'
    @route 'edit', {path: ':team_id/edit'}
  @route 'player', { path: 'player/:player_id' }

