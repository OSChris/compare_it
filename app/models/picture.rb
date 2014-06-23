class Picture < ActiveRecord::Base
  belongs_to :user
  belongs_to :gallery
  belongs_to :eatery

  has_many :likes, dependent: :destroy
  has_many :users_who_liked, through: :likes, source: :user
  
end
