App.messages = App.cable.subscriptions.create("MessagesChannel", {
  collection: function() {
    return $("[data-channel='messages']");
  },

  connected: function() {
    return setTimeout((function(_this) {
      return function() {
        _this.followCurrentStage();
        return _this.installPageChangeCallback();
      };
    })(this), 200);
  },

  received: function(data) {
    if (!this.userIsCurrentUser(data.message)) {
      return this.collection().append(data.message);
    }
  },

  userIsCurrentUser: function(message) {
    return $(message).attr('data-user-id') === $('meta[name=current-user]').attr('id');
  },

  followCurrentStage: function() {
    var stageId = this.collection().data('stage-id');

    if (typeof(stageId) !== 'undefined') {
      return this.perform('follow', {
        stage_id: stageId
      });
    } else {
      return this.perform('unfollow');
    }
  },

  installPageChangeCallback: function() {
    if (!this.installedPageChangeCallback) {
      this.installedPageChangeCallback = true;
      return $(document).on('page:change', function() {
        return App.messages.followCurrentStage();
      });
    }
  }

});

