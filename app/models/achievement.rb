class Achievement < ActiveRecord::Base
  has_many :achieveds
  has_many :users, through: :achieveds
end
