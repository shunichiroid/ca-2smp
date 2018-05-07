class ApplicationController < ActionController::Base
    #pudit
    include Pundit
    protect_from_forgery
    
    #devise
    before_action :authenticate_user!, except: [:index, :show]
end
