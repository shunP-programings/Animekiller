class TopController < ApplicationController
  def login
    user = User.authenticate(params[:uid], params[:pass])
    if user
      session[:login_uid] = params[:uid]
      redirect_to root_path
    else
      #render top_login_path
      'error'
    end
  end

  def logout
    session.delete(:login_uid)
    redirect_to root_path
  end
end
