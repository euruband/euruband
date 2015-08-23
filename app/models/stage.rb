class Stage < ActiveRecord::Base

  # validations
  #
  #

  validates :user, presence: true

  # associations
  #
  #

  belongs_to :user
  has_many :messages

  # instance methods
  #
  #

  def performance
    messages.pluck(:content).join("\n")
  end

end
