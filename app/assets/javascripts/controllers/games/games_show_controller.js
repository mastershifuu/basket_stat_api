App.GamesShowController = Ember.ObjectController.extend({
  gameStartedAt: null,

  actions: {
    gameStarted: function(){
      this.set('gameStartedAt', moment());
      Ember.Logger.info("game started:", this.get('gameStartedAt'));
    }
  }
});