class MerchantPolicy < ApplicationPolicy
    def index?
      true
    end
   
    def create?
      user.present?
    end
   
    def update?
      return user.present? && user == record.user
    end
   
    def destroy?
      return user.present? && user == record.user
    end

    private
   
    def merchant
    record
    end
end