App.GamesStatsRoute = Ember.Route.extend({
  model: function (params) {
    var self = this;
    var game = this.store.find('game', params.game_id).then(function(game){
      //Ember.Logger.info(game.get('homeTeam.id'));
      var adapter = self.store.adapterFor('application');
      var url = adapter.buildURL('statistic', params.game_id) + '/team/' + game.get('homeTeam.id');
      Ember.$.get(url).then(function (result) {
        return self.store.pushPayload('teamStat', result);
      });
    });
    //return this.store.findAll('game');
  }
});