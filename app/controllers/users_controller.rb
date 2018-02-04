class UsersController < ApplicationController

  before_action :set_user, only: [:tweets, :edit, :update]

  def tweets    
  end

  def edit
    unless @user == current_user
      redirect_to tweets_user_path(@user)
    end
  end

  def update
    @user.update(user_params)
    redirect_to tweets_user_path(@user)
  end

  def followings
    @followings # 基於測試規格，必須講定變數名稱
  end

  def followers
    @followers # 基於測試規格，必須講定變數名稱
  end

  def likes
    # 基於測試規格，必須講定變數名稱
    @user = User.find(params[:id])
    @likes = Like.where(:user_id => params[:id])

  end

  private 

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :avatar)
  end

end
