class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # admit login. redirect to user page
      log_in user
      remember user
      redirect_to user
    else
      # error
      flash.now[:danger] = "Invalid/password combination"
    render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
