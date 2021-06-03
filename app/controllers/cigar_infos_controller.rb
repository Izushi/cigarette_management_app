class CigarInfosController < ApplicationController
  def index
  end

  def show
  end

  def new
    @cigarinfo = CigarInfo.new
  end

  def create
    cigarinfo = CigarInfo.create!(cigarinfo_params)
    redirect_to cigar_info_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def cigarinfo_params
    params.require(:cigar_info).permit(:brand, :price, :text)
  end
end
