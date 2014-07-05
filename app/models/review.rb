class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :eatery

  acts_as_votable

  validates :title, :description, :price, :portion, :taste, presence: true
  
  after_save :update_eatery_averages

  delegate :profile, :full_name, to: :user

  private

  def update_eatery_averages
    self.eatery.update_averages
  end

end
