class FavoritesController < ApplicationController
  before_action :logged_in_user, only: %i[destroy create]
  before_action :correct_user, only: %i[destroy]

def create
  @micropost = Micropost.find(params[:micropost_id])  
  current_user.favorite(@micropost)
  redirect_to root_path
end

def destroy
  @favorite = Favorite.find(params[:id])
  @favorite.destroy
  redirect_to root_path
end

private

def correct_user
  @favorite = current_user.favorites.find_by(id: params[:id])
  redirect_to root_url if @favorite.nil?

end

end
