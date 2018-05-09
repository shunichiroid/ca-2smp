class PagePolicy < ApplicationPolicy
    def home?
        true
    end
   
    def vouchers?
        true
    end
end