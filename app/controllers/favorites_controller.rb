class FavoritesController < ApplicationController
  before_action :logged_in_user, only: %i[delete, create]

def create
  @micropost = Micropost.find(params[:micropost_id])  
  current_user.favorite(@micropost)
  redirect_to root_path
end

def delete
end


end
