class VoucherPolicy < ApplicationPolicy
    def show?
        return user.present? && user != voucher.user
    end

    private
   
    def voucher
    record
    end
end
