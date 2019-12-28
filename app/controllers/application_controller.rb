class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    
    private
    def current_user
        if session[:login_uid]
           User.find_by(uid:session[:login_uid])
        end
    end
    helper_method:current_user

end
