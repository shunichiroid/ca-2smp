class DealPolicy < ApplicationPolicy
    def index?
      true
    end
   
    def create?
      user.present?
    end
   
    def update?
        return user.present? && user == deal.merchant.user
    end
   
    def destroy?
      return true if user.present? && user == deal.merchant.user
    end
   
    private
   
    def deal
    record
    end
end