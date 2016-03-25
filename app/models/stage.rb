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
  has_many :contributions

  # instance methods
  #
  #

  def performance
    contributions.pluck(:content).join("\n")
  end

end
