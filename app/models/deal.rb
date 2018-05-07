class Deal < ApplicationRecord
    include ImageUploader[:image]
    belongs_to :merchant
end
