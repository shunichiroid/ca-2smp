class CreateMerchants < ActiveRecord::Migration[5.1]
  def change
    create_table :merchants do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.text :description
      t.string :street
      t.string :city
      t.string :state
      t.string :postcode
      t.decimal :latitude
      t.decimal :longitude
      t.string :website_url
      t.string :facebook_id

      t.timestamps
    end
  end
end
