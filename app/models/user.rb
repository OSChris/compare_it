class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  acts_as_voter

  has_many :reviews, dependent: :destroy

  has_many :pictures

  has_one :kent_validation, dependent: :destroy

  has_one :profile, dependent: :destroy

  delegate :avatar, to: :profile

  def email_required?
    provider.nil?
  end

  def self.find_or_create_from_twitter(oauth_data)
    user = User.where(provider: :twitter, uid: oauth_data["uid"]).first

    unless user
      name = oauth_data["info"]["name"].split(" ")
      user = User.create(first_name: name[0],
                         last_name:  name[1],
                         password: Devise.friendly_token[0, 20],
                         provider: :twitter,
                         uid: oauth_data["uid"],
                         twitter_access_token: oauth_data["credentials"]["token"],
                         twitter_access_token_secret: oauth_data["credentials"]["secret"])
      profile = Profile.new
      profile.user = user
      profile.save
    end
    user
  end

  def self.find_or_create_from_google(oauth_data)
    user = User.where(provider: :google_oauth2, uid: oauth_data["uid"]).first

    unless user
      user = User.create(first_name: oauth_data["info"]["first_name"],
                         last_name:  oauth_data["info"]["last_name"],
                         email:      oauth_data["info"]["email"],
                         password: Devise.friendly_token[0, 20],
                         provider: :google_oauth2,
                         uid: oauth_data["uid"])
      profile = Profile.new
      profile.user = user
      profile.save
    end
    user
  end



  def full_name
    if first_name || last_name
      "#{first_name} #{last_name}".squeeze(" ").strip
    else
      email
    end
  end


end
