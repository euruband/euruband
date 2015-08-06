class Message < ActiveRecord::Base
  belongs_to :stage
  belongs_to :user

  after_save   :update_performance
  after_commit :broadcast

  private

  def update_performance
    performance = stage.performance.to_s + self.content.to_s + ";"
    self.stage.update_column(:performance, performance)
  end

  def broadcast
    ActionCable.server.broadcast(
      "stages:#{self.stage_id}:messages",
      message: MessagesController.render(partial: 'messages/message', locals: { message: self })
    )
  end
end
