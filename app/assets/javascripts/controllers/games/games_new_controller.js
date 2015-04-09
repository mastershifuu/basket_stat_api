App.GamesNewController = Ember.ObjectController.extend({
  //needs: ['games'],
  selectedHomeTeam: null,
  selectedAwayTeam: null,

  allTeams: function() {
    return this.store.findAll('team')
  }.property(),

  homeTeamDidChange: function (sender, key, value, rev){
    var team = this.get('selectedHomeTeam');
    if (!Ember.isEmpty(team)) {
      this.model.set('homeTeam', team);
    }
  }.observes('selectedHomeTeam'),

  awayTeamDidChange: function (sender, key, value, rev) {
    var team = this.get('selectedAwayTeam');
    if (!Ember.isEmpty(team)) {
      this.model.set('awayTeam', team);
    }
  }.observes('selectedAwayTeam'),

  onSave: function (game) {
    return this.transitionToRoute('games.show', game);
  },

  onError: function (reason) {
    var errors = $.parseJSON(reason.responseText);
    Ember.Logger.error("Error on create new Game: ", errors);
  },

  actions: {
    cancel: function () {
      this.model.deleteRecord();
      return this.transitionToRoute('games.index');
    },

    save: function () {
      return this.model.save().then(this.onSave.bind(this)).catch(this.onError);
    }
  }
});