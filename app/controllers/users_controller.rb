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
      password_confirmation: params[:user][:password_confirmation],
      image: params[:user][:image]
      )
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
   @user.update(message: params[:anime][:message])
   @user.update(title: params[:anime][:title])
    if user.save
      redirect_to users_path
    else
       render 'edit'
       #render :edit
    end
  end
  
  def get_image
#    user = User.find(params[:id])
#    send_data user.file, disposition: :inline, type:'image/png'
  
  @user = User.find_by(id: params[:id])
  #画像データが送信された場合
    if params[:image]
      #データベースに保存するファイル名はユーザーのid.jpgとする
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image}",image.read)
    end
  end
  
end
