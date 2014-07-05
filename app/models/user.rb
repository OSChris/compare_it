class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_voter

  has_many :reviews, dependent: :destroy

  has_many :pictures

  has_one :kent_validation, dependent: :destroy

  has_one :profile, dependent: :destroy

  delegate :avatar, to: :profile

  def full_name
    if first_name || last_name
      ["#{first_name}", "#{last_name}"].map(&:capitalize).join(" ").squeeze(" ").strip
    else
      email
    end
  end


end
