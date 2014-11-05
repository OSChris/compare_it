class WishpondTest < ActiveRecord::Base

  alias_attribute :first_name, :'first-name'
  alias_attribute :last_name, :'last-name'

end
