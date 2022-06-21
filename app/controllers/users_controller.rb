class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :getUser, only: [:correct_user, :show, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def show; end

  def new
    @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page], per_page: params[:per_page] || 10)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = t("app.welcome")
      return redirect_to @user
    end
    render :new
  end

  def update
    if @user.update(user_params)
      flash[:success] = t("users.edit.profile_updated")
      redirect_to @user
    else
      render :edit
    end
  end

  def edit; end

  def destroy
    @user.destroy
    flash[:success] = t("users.delete.deleted")
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def getUser
    @user = User.find(params[:id])
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = t("app.please_login")
      redirect_to login_url
    end
  end

  def correct_user
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
