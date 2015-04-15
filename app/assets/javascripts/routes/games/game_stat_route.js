App.GamesStatsRoute = Ember.Route.extend({
  model: function (params) {
    return this.store.find('statistic', { game_id: params.game_id });
  }
});