class MerchantPolicy < ApplicationPolicy
    def index?
      true
    end
   
    def create?
      user.present?
    end
   
    def update?
      return true if user.present? && user == merchant.user
    end
   
    def destroy?
      return true if user.present? && user == merchant.user
    end
   
    private
   
    def merchant
    record
    end
end