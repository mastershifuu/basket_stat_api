App.TeamsEditController = Ember.ObjectController.extend
  onSave: (team)->
    @transitionToRoute 'teams.show', team

  failure: (reason) ->
    Ember.Logger.error "Error on edit new Team: ", reason

  actions:
    cancel: ->
      @model.rollback()
      @transitionToRoute 'teams'
    save: ->
      @model.save().then(@onSave.bind(@))
