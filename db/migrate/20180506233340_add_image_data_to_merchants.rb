class AddImageDataToMerchants < ActiveRecord::Migration[5.1]
  def change
    add_column :merchants, :image_data, :text
  end
end
