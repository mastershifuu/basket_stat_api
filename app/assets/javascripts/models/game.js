App.Game = DS.Model.extend({
  homeTeam: DS.belongsTo('team', { async: true }),
  awayTeam: DS.belongsTo('team', { async: true }),

  date: DS.attr('date'),
  startedAt: DS.attr('date'),
  finishedAt: DS.attr('date'),

  isFinished: function(){
    return isPresent(this.get('finishedAt'));
  }.property('finishedAt')

});
