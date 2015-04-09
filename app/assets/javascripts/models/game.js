App.Game = DS.Model.extend({
  homeTeam: DS.belongsTo('team', { async: true }),
  awayTeam: DS.belongsTo('team', { async: true }),

  date: DS.attr('date', Date),

  shortDate: function () {
    return moment(this.get('date')).format('ll');
  }.property('date')
});
