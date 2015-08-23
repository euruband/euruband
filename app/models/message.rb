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

  before_save :sanitize_content
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

  def sanitize_content
    self.content = self.content.to_s.gsub(/\n/, '')
  end

end
