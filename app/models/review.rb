class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :eatery

  acts_as_votable

  validates :title, :description, :price, :portion, :taste, presence: true
  
  after_save :update_eatery_total_average

  delegate :profile, :full_name, to: :user

  private

  def update_eatery_total_average
    self.eatery.update_total_average
  end

end
