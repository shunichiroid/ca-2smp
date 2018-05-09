class Deal < ApplicationRecord
    include ImageUploader[:image]
    belongs_to :merchant
    has_many :vouchers

    def self.search_by_name(search)
        where("LOWER(description) LIKE ?", "%#{search.downcase}%")
    end
end
