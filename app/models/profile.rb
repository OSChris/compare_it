class Profile < ActiveRecord::Base
  belongs_to :user

  acts_as_votable

  has_attached_file :avatar, :styles => { medium: "300x300>", gallery: "200x200", thumb: "100x100>", tiny: "50x50" }, :default_url => "/images/:styles/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


end
