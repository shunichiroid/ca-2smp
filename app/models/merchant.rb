class Merchant < ApplicationRecord
  include ImageUploader[:image]
  belongs_to :user
  has_many :deals
end
