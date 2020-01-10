class AnimesController < ApplicationController
  def index
    @animes = Anime.all
    @anime = Anime.new
    @like_ranks = Anime.find(Like.group(:anime_id).order('count(anime_id) desc').limit(3).pluck(:anime_id))
    @bad_ranks = Anime.find(Bad.group(:anime_id).order('count(anime_id) desc').limit(3).pluck(:anime_id))
  end

  def new
    @anime = Anime.new
  end

  def create
    user_id = User.find_by(uid: session[:login_uid]).id
    @anime = Anime.new(message: params[:anime][:message], user_id: user_id)
    @anime = Anime.new(title: params[:anime][:title], user_id: user_id)
    #params.require(:user).permit(:image)
    if @anime.save
      redirect_to animes_path
    else
      render new_anime_path
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:content, :image)
    end
  
  

  def edit
      @anime = Anime.find(params[:id])
  end

  def update
     anime = Anime.find(params[:id])
     anime.update(message: params[:anime][:message])
     anime.update(title: params[:anime][:title])
    if anime.save
      redirect_to animes_path
    else
       render :edit
    end
  end

  def destroy
    anime = Anime.find(params[:id])
    anime.destroy
    redirect_to animes_path
  end

end
