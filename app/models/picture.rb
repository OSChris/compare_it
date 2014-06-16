class Picture < ActiveRecord::Base
  belongs_to :user
  belongs_to :gallery

  has_many :likes, dependent: :destroy
  has_many :users_who_liked, through: :likes, source: :user
  
end
