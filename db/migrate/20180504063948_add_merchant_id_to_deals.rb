class AddMerchantIdToDeals < ActiveRecord::Migration[5.1]
  def change
    add_reference :deals, :merchant, foreign_key: true
  end
end
