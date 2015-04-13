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
    return this.store.find(
        'player',
        {team_id: this.get('.model.homeTeam.id')}
    );
  }.property(),

  canNotStart: function(){
    var players = this.get('inGamePlayers');
    return players.any(function(item){
      return Ember.isEmpty(item.get('home'))
    });
  }.property('inGamePlayers.@each.home'),

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