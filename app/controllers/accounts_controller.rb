class AccountController < ApplicationController
  skip_forgery_protection only: [:create]

  def create
    current_user.update(email: params[:email])
    redirect_to account_path, notice: "Email updated"
  end
end
