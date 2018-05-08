class ApplicationController < ActionController::Base
#pudit
    include Pundit
    after_action :verify_authorized, except: :index, unless: :devise_controller?
    protect_from_forgery
    
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

 #devise
    before_action :authenticate_user!, except: [:index, :show]

    private
   
      def user_not_authorized
        flash[:warning] = "You are not authorized to perform this action."
        redirect_to(request.referrer || root_path)
      end
end
