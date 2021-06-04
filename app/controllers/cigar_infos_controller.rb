class CigarInfosController < ApplicationController
  before_action :set_cigarinfo, only: [:show, :edit, :update, :destroy]

  def index
    @cigarinfos = CigarInfo.order(id: :asc)
  end

  def show
  end

  def new
    @cigarinfo = CigarInfo.new
  end

  def create
    cigarinfo = CigarInfo.create!(cigarinfo_params)
    redirect_to cigar_info_path(cigarinfo)
  end

  def edit
  end

  def update
    @cigarinfo.update!(cigarinfo_params)
    redirect_to @cigarinfo
  end

  def destroy
    @cigarinfo.destroy!
    redirect_to cigar_infos_path
  end

  private

  def set_cigarinfo
    @cigarinfo = CigarInfo.find(params[:id])
  end

  def cigarinfo_params
    params.require(:cigar_info).permit(:brand, :price, :text)
  end
end
