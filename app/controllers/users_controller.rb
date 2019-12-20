class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      uid: params[:user][:uid],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation])
      #params.require(:user).permit(:image)
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end
  

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end
  
  def edit
    @anime = Anime.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def get_image
    user = User.find(params[:id])
    send_data user.file, disposition: :inline, type:'image/png'
  end

  
end
