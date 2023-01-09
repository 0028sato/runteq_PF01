class Admin::UsersController < Admin::BaseController
    before_action :set_user, only: %i[edit show update destroy]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).order(created_at: :desc).page(params[:page])
  end

  def edit;end

  def show;end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), success: "更新に成功しました"
    else
      flash.now[:danger] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @user.destroy!
    redirect_to admin_users_path, success: 'ユーザーを削除しました'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :role)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
