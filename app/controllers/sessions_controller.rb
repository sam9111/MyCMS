class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in
  skip_before_action :ensure_user_is_owner

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user
      if user.authenticate(params[:password])
        session[:current_user_id] = user.id
        redirect_to root_path
      else
        flash[:error] = "Your login attempt was invalid.Please retry!"
        redirect_to new_sessions_path
      end
    else
      flash[:error] = "Please create your account before signing in!"
      redirect_to root_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    session[:cart] = nil
    @current_user = nil
    redirect_to root_path
  end
end
