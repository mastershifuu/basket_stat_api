//# For more information see: http://emberjs.com/guides/routing/

App.Router.map(function () {
  this.resource('teams', function () {
    this.route('new');
    this.route('edit', { path: ':team_id/edit' });
    this.route('show', { path: ':team_id' });
  });
  this.resource('player', { path: 'player' }, function () {
    this.route('edit', { path: ':player_id/edit' });
    this.route('new');
    return this.route('show', { path: ':player_id/show' });
  });
  this.resource('games', function(){
    this.route('new')
  })
});