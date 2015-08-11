class Stage < ActiveRecord::Base

  # validations
  #
  #

  validates :user, presence: true
  belongs_to :user
  has_many :messages
end
