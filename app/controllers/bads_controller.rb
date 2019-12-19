class BadsController < ApplicationController
  def create
   anime = Anime.find(params[:anime_id])
    unless anime.bad?(current_user)
      anime.bad(current_user)
    end
    redirect_to root_path
  end

  def destroy
    anime = Anime.find(params[:id])
    if anime.bad?(current_user)
      anime.unbad(current_user)
    end
    redirect_to root_path
  end

end
