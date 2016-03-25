class User < ActiveRecord::Base
  has_many :messages
  has_many :stages
  has_many :contributions
end
