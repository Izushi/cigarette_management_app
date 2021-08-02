class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[edit update destroy]

  def index
    @profile = current_user.profiles.last
  end

  def new
    @profile = current_user.profiles.new
  end

  def create
    @profile = current_user.profiles.new(profile_params)
    if @profile.save
      redirect_to profiles_path, notice: "登録しました"
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profiles_path, notice: "更新しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @profile.destroy!
    redirect_to profiles_path, alert: "削除しました"
  end

  private

  def profile_params
    params.require(:profile).permit(:cigar_amount, :box_price)
  end

  def set_profile
    @profile = current_user.profiles.find(params[:id])
  end
end
