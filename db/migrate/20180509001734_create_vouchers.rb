class CreateVouchers < ActiveRecord::Migration[5.1]
  def change
    create_table :vouchers do |t|
      t.references :deal, foreign_key: true
      t.references :user, foreign_key: true
      t.text :image_data
      t.string :uuid

      t.timestamps
    end
  end
end
