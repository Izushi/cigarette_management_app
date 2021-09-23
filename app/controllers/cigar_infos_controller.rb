class CigarInfosController < ApplicationController
  before_action :set_cigarinfo, only: [:show, :edit, :update, :destroy]

  def index
    @cigarinfos = current_user.cigar_infos.order(id: :asc)
  end

  def show
  end

  def new
    @cigarinfo = current_user.cigar_infos.new
  end

  def create
    @cigarinfo = current_user.cigar_infos.new(cigarinfo_params)
    if @cigarinfo.save
      redirect_to cigar_info_path(@cigarinfo), notice: "登録しました" #createアクションで定義した変数@cigarinfo
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
    @cigarinfo = current_user.cigar_infos.find(params[:id])
  end

  def cigarinfo_params
    params.require(:cigar_info).permit(:brand, :price, :text, :img, :remove_img)
  end

end
