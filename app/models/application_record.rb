class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def self.full_address
    #e.g. "120 Spencer st, Melbourne, Victoria, 3000, AU"
    "#{street}, #{city}, #{state}, #{postcode}"
  end
end
