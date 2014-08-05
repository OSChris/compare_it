class Eatery < ActiveRecord::Base

  searchkick word_start: [:name]
  
  has_many :reviews, dependent: :destroy
  has_many :users_who_reviewed, through: :reviews, source: :user

  acts_as_votable

  has_many :categorizations
  has_many :categories, through: :categorizations

  has_one :gallery, dependent: :destroy
  has_many :pictures, through: :gallery

  self.per_page = 10

  scope :popular_eats, -> { select("eateries.*, COUNT(votes.id) vote_count").
                            joins("LEFT OUTER JOIN votes ON votes.votable_id = eateries.id AND votes.votable_type = 'Eatery'").
                            group("eateries.id").
                            order("vote_count DESC") }
                            
  scope :hall_of_fame, -> { where("total_average > 7.0")}
  scope :hall_of_shame, -> { where("total_average < 3.5").order("total_average DESC")}

  geocoded_by :address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates




  #####################################################################
  # This import method is how I originally populated the DB -- IGNORE #
  #####################################################################

  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      eatery_hash = row.to_hash
      eatery = Eatery.where(id: eatery_hash["id"])

      if eatery.count == 1
        eatery.first.update_attributes(eatery_hash)
      else
        Eatery.create!(eatery_hash)
      end # end if !eatery.nil?
    end # end CSV.foreach
  end # end self.import(file)
  
  #####################################################################
  #                                                                   #
  #####################################################################




  # UPDATE the average scores of an eatery upon each review submission
  def update_total_average
    self.average_price = self.reviews.average(:price)
    self.average_portion = self.reviews.average(:portion)
    self.average_taste = self.reviews.average(:taste)
    self.total_average = (self.reviews.average(:price) + self.reviews.average(:portion) + self.reviews.average(:taste)) / 3 
    self.save
  end

  private

  # def self.search(search)
  #   if search
  #     search = "%#{search}%"
  #     where("eateries.name ILIKE ? OR eateries.address ILIKE ?",
  #     search, search)
  #   else
  #     all
  #   end
  # end

end
