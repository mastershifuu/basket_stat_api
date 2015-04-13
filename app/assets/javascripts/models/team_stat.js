App.TeamStat = DS.Model.extend({
  game: DS.belongsTo('game'),
  playerStats: DS.hasMany('playerStat')
});
