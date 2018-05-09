class Deal < ApplicationRecord
    include ImageUploader[:image]
    belongs_to :merchant
    has_many :vouchers

    def self.search_by_name(search)
        where("LOWER(description) LIKE ?", "%#{search.downcase}%")
    end

    # def self.voucher_limit
    #     Voucher.where(@deal).count < @deal.quantity && Voucher.where(@deal, @deal.user).count < @deal.voucher_limit_per_user
    # end
end
