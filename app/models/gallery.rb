class Gallery < ActiveRecord::Base
  
  belongs_to :eatery

  has_many :pictures, dependent: :destroy
  

end
