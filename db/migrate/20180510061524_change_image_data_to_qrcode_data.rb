class ChangeImageDataToQrcodeData < ActiveRecord::Migration[5.1]
  def change
    rename_column :vouchers, :image_data, :qrcode_data
  end
end
