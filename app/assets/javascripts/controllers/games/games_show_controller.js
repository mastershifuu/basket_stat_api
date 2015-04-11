App.GamesShowController = Ember.ObjectController.extend({
  gameStartedAt: null,

  actions: {
    gameStarted: function(){
      this.get('content.start');
    }
  }
});