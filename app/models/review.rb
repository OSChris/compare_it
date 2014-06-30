class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :eatery

  acts_as_votable

  validates :title, :description, :price, :portion, :taste, presence: true
  



end
