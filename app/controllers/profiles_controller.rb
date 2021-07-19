class ProfilesController < ApplicationController
  def index
    @profile = Profile.last
  end

  def new
    @profile = Profile.new
  end

  def create
    profile = Profile.create!(profile_params)
    redirect_to profiles_path
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    profile = Profile.find(params[:id])
    profile.update!(profile_params)
    redirect_to profiles_path
  end

  def destroy
    profile = Profile.find(params[:id])
    profile.destroy!
    redirect_to profiles_path
  end

  private

  def profile_params
    params.require(:profile).permit(:cigar_amount, :box_price)
  end
end
