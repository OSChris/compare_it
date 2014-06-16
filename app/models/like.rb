class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :picture
  belongs_to :review
  belongs_to :eatery
end
