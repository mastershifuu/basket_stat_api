App.GamesNewController = Ember.ObjectController.extend({
  selectedHomeTeam: null,
  selectedAwayTeam: null,
  allTeams: function() {
    return this.store.findAll('team')
  }.property(),

  actions: {}
});