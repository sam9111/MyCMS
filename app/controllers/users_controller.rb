class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in
  skip_before_action :ensure_user_is_owner

  def create
    name = params[:name].capitalize
    email = params[:email]
    password = params[:password]
    user = User.new(name: name, email: email, password: password, role: "customer")
    if user.save
      session[:current_user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end
end
