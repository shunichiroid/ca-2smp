class ApplicationController < ActionController::Base
    #pudit
    include Pundit
    after_action :verify_authorized, except: :index, unless: :devise_controller?
    protect_from_forgery
    
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    #devise
    before_action :store_user_location!, if: :storable_location?
    before_action :authenticate_user!, except: [:home, :index, :show]

    # def create
    #     @user = User.new(user_params)

    #     if @user.save
    #         ModelMailer.voucher_mail(@user).deliver_now
    #         format.html{ redirect_to @user}
    #     end
    # end

    # def after_sign_in_path_for(resource)
    #     current_user_path
    # end

    private
    #pudit
    def user_not_authorized
        flash[:warning] = "You are not authorized to perform this action."
        redirect_to(request.referrer || root_path)
    end

    def storable_location?
        request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
    end
  
    def store_user_location!
        # :user is the scope we are authenticating
        store_location_for(:user, request.fullpath)
    end
end
