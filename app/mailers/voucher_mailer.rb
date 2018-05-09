class VoucherMailer < ApplicationMailer
    def voucher_mail(voucher)
        @voucher = voucher
        mail to: @voucher.user.email, subject: "You created a new voucher"
    end
end