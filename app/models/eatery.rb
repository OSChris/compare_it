class Eatery < ActiveRecord::Base

  has_many :reviews, dependent: :destroy
  has_many :users_who_reviewed, through: :reviews, source: :user

  has_many :likes, dependent: :destroy
  has_many :users_who_liked, through: :likes, source: :user

  has_many :categorizations
  has_many :categories, through: :categorizations

  has_one :gallery, dependent: :destroy
  has_many :pictures, through: :gallery

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


end
