class RegistrationsController < ApplicationController
  # Without this, the Authentication concern requires login before signup —
  # the chicken-and-egg problem.
  allow_unauthenticated_access only: [ :new, :create ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      start_new_session_for @user
      redirect_to root_path, notice: "Welcome."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.expect(user: [ :email_address, :password, :password_confirmation ])
    end
end
