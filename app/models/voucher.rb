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
    url = "http://localhost:3000/vouchers/verify/#{self.uuid}"
    qr = RQRCode::QRCode.new(url)
    png = qr.as_png(
      resize_gte_to: false,
      resize_exactly_to: false,
      fill: 'white',
      color: 'black',
      size: 120,
      border_modules: 4,
      module_px_size: 6,
      file: nil # path to write
      )
    uploader = QRUploader.new(:store)
    io = StringIO.new(png.to_blob) #to_s.force_encoding("BINARY")
    uploaded_png = uploader.upload(io)
    self.qrcode = uploaded_png
    uploaded_png.close
    io.close
    return true
  end

end
