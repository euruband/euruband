class Stage < ActiveRecord::Base
  belongs_to :user

  has_many :messages
  has_many :performances
end
