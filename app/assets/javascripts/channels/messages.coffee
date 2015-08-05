App.messages = App.cable.subscriptions.create "MessagesChannel",
  collection: -> $("[data-channel='messages']")

  connected: ->
    # FIXME: While we wait for cable subscriptions to always be finalized before sending messages
    setTimeout =>
      @followCurrentStage()
      @installPageChangeCallback()
    , 1000

  received: (data) ->
    @collection().append(data.message) unless @userIsCurrentUser(data.message)

  userIsCurrentUser: (message) ->
    $(message).attr('data-user-id') is $('meta[name=current-user]').attr('id')

  followCurrentStage: ->
    if stageId = @collection().data('stage-id')
      @perform 'follow', stage_id: stageId
    else
      @perform 'unfollow'

  installPageChangeCallback: ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'page:change', -> App.messages.followCurrentStage()
