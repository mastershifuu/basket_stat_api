App.GameTimerComponent = Ember.Component.extend({
  message: 'Hello!!!',

  greeting: function(){
    return this.get('message');
  }.property('message')
});

