class AnimesController < ApplicationController
  def index
    @animes = Anime.all
    @anime = Anime.new
  end

  def new
    @anime = Anime.new
  end

  def create
    user_id = User.find_by(uid: session[:login_uid]).id
    @anime = Anime.new(message: params[:anime][:message], user_id: user_id)
    if @anime.save
      redirect_to animes_path
    else
      render new_anime_path
    end
  end

  def destroy
    anime = Anime.find(params[:id])
    anime.destroy
    redirect_to animes_path
  end

end
