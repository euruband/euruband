class Message < ActiveRecord::Base

  NOTIFICATIONS = [
    'raises his/her fists to the air!',
    'shakes her/his hair!',
    'brought in a new tune!',
  ]

  # validations
  #
  #

  validates :user, presence: true

  # associations
  #
  #

  belongs_to :stage
  belongs_to :user

  # callbacks
  #
  #

  after_commit :broadcast

  # instance methods
  #
  #

  def contribution
    Contribution.find_by(user: user, stage: stage).presence || user.contributions.create(stage: stage, content: content)
  end

  private

  def broadcast
    ActionCable.server.broadcast(
      "stages:#{self.stage_id}:messages",
      message: MessagesController.render(partial: 'messages/message', locals: { message: self })
    )
  end

end
