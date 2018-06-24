class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      if @user.activated?
        # admit login. redirect to user page
        log_in @user
        # use cookie when remember_me = 1
        params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
        redirect_back_or @user
      else
        message = 'Acconut not activated'
        message += 'Check your email for the activation link.'
        flash[:warning] = message
        redirect_to root_url
      end

    else
      # error
      flash.now[:danger] = 'Invalid/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
