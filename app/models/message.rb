class Message < ActiveRecord::Base
  belongs_to :stage
  belongs_to :user

  after_commit :broadcast

  private

  def broadcast
    ActionCable.server.broadcast(
      "stages:#{self.stage_id}:messages",
      message: MessagesController.render(partial: 'messages/message', locals: { message: self })
    )
  end
end
