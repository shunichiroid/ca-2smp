class Deal < ApplicationRecord
    include ImageUploader[:image]
    belongs_to :merchant

    def self.search_by_name(search)
        where("LOWER(description) LIKE ?", "%#{search.downcase}%")
    end
end
