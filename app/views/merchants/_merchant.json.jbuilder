json.extract! merchant, :id, :user_id_id, :name, :description, :street, :city, :state, :postcode, :latitude, :longitude, :website_url, :facebook_id, :created_at, :updated_at
json.url merchant_url(merchant, format: :json)
