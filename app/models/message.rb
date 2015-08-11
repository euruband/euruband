class Message < ActiveRecord::Base

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

  private

  def broadcast
    ActionCable.server.broadcast(
      "stages:#{self.stage_id}:messages",
      message: MessagesController.render(partial: 'messages/message', locals: { message: self })
    )
  end

end
