class CreateDeals < ActiveRecord::Migration[5.1]
  def change
    create_table :deals do |t|
      t.string :title
      t.text :description
      t.text :image_data
      t.decimal :original_price
      t.decimal :offer_price
      t.timestamp :expiry
      t.integer :quantity
      t.integer :voucher_limit_per_user
      t.string :charge_id

      t.timestamps
    end
  end
end
