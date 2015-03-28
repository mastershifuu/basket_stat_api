App.TeamsNewController = Ember.ObjectController.extend
  onSave: (team)->
    @transitionToRoute 'teams.show', team

  failure: (reason) ->
    Ember.Logger.error "Error on create new Team: ", reason

  actions:
    cancel: ->
      @model.deleteRecord()
      @transitionToRoute 'teams'
    save: ->
      @model.save().then(@onSave.bind(@))
