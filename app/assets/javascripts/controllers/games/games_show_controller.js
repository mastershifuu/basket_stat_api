App.GamesShowController = Ember.Controller.extend({
  gameStartedAt: null,
  timerValue: null,

  //init: function () {
  //  this._super();
  //  this.set('oldHomePlayers', this.get('homeInGamePlayers'));
  //},

  inGamePlayers: Ember.makeArray([
    Ember.Object.create({home: null, away: null}),
    Ember.Object.create({home: null, away: null}),
    Ember.Object.create({home: null, away: null}),
    Ember.Object.create({home: null, away: null}),
    Ember.Object.create({home: null, away: null})
  ]),

  availableHomePlayers: function(){
    return this.get('model.homeTeam.players')
  }.property('model.homeTeam'),

  filteredHomePlayers: function(){
    var selected = this.get('inGamePlayers').getEach('home');
    var filtered = this.get('availableHomePlayers');
    filtered.forEach(function (player) {
       if (selected.contains(player)){
         player.set('selected', true);
       } else {
         player.set('selected', false);
       }
    });
    return filtered;
  }.property('inGamePlayers.@each.home'),

  canNotStart: function(){
    var players = this.get('inGamePlayers');
    return players.any(function(item){
      return Ember.isEmpty(item.get('home'))
    });
  }.property('inGamePlayers.@each.home'),

  homePlayerDidChange: function(){
    var players = this.get('inGamePlayers');
    players.forEach(function(obj){
      player = obj.get('home');
      oldPlayer = obj.get('oldHome');
      if ( player != oldPlayer) {
        if (Ember.isPresent(oldPlayer)) {
          Ember.Logger.info('OUT: ', oldPlayer.get('number'));
        }
        Ember.Logger.info('IN: ', player.get('number'));
        obj.set('oldHome', player);
      }
    });

  }.observes('inGamePlayers.@each.home'),

  actions: {
    gameStarted: function(){
      // starting game
      this.get('content.start');
    },

    finishGame: function(){
      // finishing game
      this.get('content.finish');
      return this.transitionToRoute('games.stats', this.get('model'))
    },

    gameEvent: function(player, type){
      var time = this.get('timerValue');
      if (Ember.isPresent(player) && Ember.isPresent(time)) {
        //Em.Logger.info('player: ', player, 'type: ', type);
        var gameEvent = this.store.createRecord('gameEvent', {
          eventCode: type,
          eventTime: time,
          player: player,
          gameId: this.get('model.id')
        });
        gameEvent.save();
      }
    }
  }
});