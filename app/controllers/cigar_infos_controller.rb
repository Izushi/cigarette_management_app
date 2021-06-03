class CigarInfosController < ApplicationController
  def index
    @cigarinfos = CigarInfo.order(id: :asc)
  end

  def show
    @cigarinfo = CigarInfo.find(params[:id])
  end

  def new
    @cigarinfo = CigarInfo.new
  end

  def create
    cigarinfo = CigarInfo.create!(cigarinfo_params)
    redirect_to cigar_info_path(cigarinfo)
  end

  def edit
    @cigarinfo = CigarInfo.find(params[:id])
  end

  def update
    cigarinfo = CigarInfo.find(params[:id])
    cigarinfo.update!(cigarinfo_params)
    redirect_to cigarinfo
  end

  def destroy
    cigarinfo = CigarInfo.find(params[:id])
    cigarinfo.destroy!
    redirect_to cigar_infos_path
  end

  private

  def cigarinfo_params
    params.require(:cigar_info).permit(:brand, :price, :text)
  end
end
