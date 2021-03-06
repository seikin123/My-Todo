class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i(show edit update destroy)

  def show

  end

  def edit
    
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を更新しました"
      redirect_to :root
    else
      render action: :edit
    end
  end

  def out
    user = current_user
    user.update(is_deleted: true) #is_deletedをtrueへ
    reset_session #データをリセットする
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to :root
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end

end
