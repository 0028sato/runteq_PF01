class PasswordResetsController < ApplicationController
  skip_before_action :require_login
  before_action :set_token, only: %i[edit update]

  def new;end

  def create
    @user = User.find_by(email: params[:email])
    @user&.deliver_reset_password_instructions!
    redirect_to login_path, succes: t('.succes')
  end

  def edit
    @user = User.load_from_reset_password_token(@token)
    return not_authenticated if @user.blank?
  end

  def update
    @user = User.load_from_reset_password_token(@token)
    if @user.blank?
      not_authenticated
      return
    end
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.change_password(params[:user][:password])
      redirect_to login_path, succes: t('.succes')
    else
      flash.now[:danger] = t('fail')
      render :edit
    end
  end

  private

  def set_token
    @token = params[:id]
  end
end
