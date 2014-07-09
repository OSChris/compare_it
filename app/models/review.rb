class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :eatery

  acts_as_votable

  validates :title, :description, :price, :portion, :taste, presence: true
  
  after_save :update_eatery_total_average

  delegate :profile, :full_name, to: :user

  scope :best_reviews, -> { select("reviews.*, COUNT(votes.id) vote_count").
                            joins("LEFT OUTER JOIN votes ON votes.votable_id = reviews.id AND votes.votable_type = 'Review'").
                            group("reviews.id").
                            order("vote_count DESC") }

  private

  def update_eatery_total_average
    self.eatery.update_total_average
  end

end
