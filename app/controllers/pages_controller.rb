class PagesController < ApplicationController
  
  def home
    @deals = Deal.all
    authorize @deals, :vouchers?
  end

  def vouchers
    @vouchers = Voucher.joins(:deal).select("vouchers.*, deals.*").where("vouchers.user_id = ? AND deals.expiry > ?", current_user.id, Date.today)
    # @vouchers = current_user.vouchersV
    # @expired_vouchers = Voucher
    @expired_vouchers = Voucher.joins(:deal).select("vouchers.*, deals.*").where("vouchers.user_id = ? AND deals.expiry < ?", current_user.id, Date.today)

    authorize @vouchers, :vouchers?
  end
end
