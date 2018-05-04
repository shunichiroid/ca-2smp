json.extract! deal, :id, :title, :description, :image_data, :original_price, :offer_price, :expiry, :quantity, :voucher_limit_per_user, :charge_id, :created_at, :updated_at
json.url deal_url(deal, format: :json)
