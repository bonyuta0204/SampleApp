class FavoritesController < ApplicationController
  before_action :logged_in_user, only: %i[destroy create]
  before_action :correct_user, only: %i[destroy]

  def create
    @micropost = Micropost.find(params[:micropost_id])  
    current_user.favorite(@micropost)
    respond_to do |format|
      format.html { redirect_to @user}
      format.js
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to @user}
      format.js
    end
  end

  private

  def correct_user
    @favorite = current_user.favorites.find_by(id: params[:id])
    redirect_to root_url if @favorite.nil?

  end

end
