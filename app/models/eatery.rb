class Eatery < ActiveRecord::Base

  has_many :reviews, dependent: :destroy
  has_many :users_who_reviewed, through: :reviews, source: :user

  has_many :likes, dependent: :destroy
  has_many :users_who_liked, through: :likes, source: :user

  has_many :categorizations
  has_many :categories, through: :categorizations


end
