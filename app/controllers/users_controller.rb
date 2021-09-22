class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @training_new = Training.new
    @food_new = Food.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id),notice:'You have updated user successfully!'
    else
      render :edit
    end
  end

  def withdrow #退会画面を表示するアクション
    @user = User.find(params[:id])
  end

  def switch
    @user = User.find(params[:id])
    if @user.update(user_status: false)
      sign_out current_user #URLを踏ませずにコントローラーから直接サインアウトの指示を出す（device公式)
    end
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name,:gender,:introduction,:image)
  end
end
