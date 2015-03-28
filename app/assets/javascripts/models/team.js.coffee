App.Team = DS.Model.extend
  name: DS.attr('string')
  description: DS.attr('string')

  players: DS.hasMany('player', {async: true})
