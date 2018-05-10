class Voucher < ApplicationRecord
  belongs_to :deal
  belongs_to :user

  include QRUploader::Attachment.new(:qrcode)
  before_validation :generate_uuid, on: :create
  before_validation :generate_qrcode, on: :create

  def generate_uuid
    self.uuid = SecureRandom.uuid
  end

  def generate_qrcode
    
  end

end
