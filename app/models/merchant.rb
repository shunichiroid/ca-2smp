class Merchant < ApplicationRecord
  include ImageUploader[:image]
  belongs_to :user
  has_many :deals

  def full_address
    #e.g. "120 Spencer st, Melbourne, Victoria, 3000, AU"
    "#{street}, #{city}, #{state}, #{postcode}"
  end
end
