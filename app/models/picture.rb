class Picture < ActiveRecord::Base
  belongs_to :user
  belongs_to :gallery
  belongs_to :eatery

  acts_as_votable

  delegate :full_name, to: :user

  has_attached_file :picture, :styles => { :large => "800x800", :medium => "300x300>", :thumb => "100x100>", :tiny => "50x50" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/


  
end
