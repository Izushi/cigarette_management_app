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
    @cigarinfo = CigarInfo.new(cigarinfo_params)
    if @cigarinfo.save
      redirect_to cigar_info_path(@cigarinfo), notice: "登録しました" #createアクションで定義した変数cigarinfo
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new
    end
  end

  def edit
  end

  def update
    if @cigarinfo.update(cigarinfo_params)
      redirect_to @cigarinfo, notice: "更新しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @cigarinfo.destroy!
    redirect_to cigar_infos_path, alert: "削除しました"
  end

  private

  def set_cigarinfo
    @cigarinfo = CigarInfo.find(params[:id])
  end

  def cigarinfo_params
    params.require(:cigar_info).permit(:brand, :price, :text)
  end
end
