class LikesController < ApplicationController

  def create
    anime = Anime.find(params[:anime_id])
   #if @bad= Bad.find_by(user_id: current_user.id, anime_id: params[:anime_id])
   #   @bad.destroy
   #end
    unless anime.liked?(current_user)
      anime.like(current_user)
    end
    redirect_to root_path
  end

  def destroy
    anime = Anime.find(params[:id])
    if anime.liked?(current_user)
      anime.unlike(current_user)
    end
    redirect_to root_path
  end

end
