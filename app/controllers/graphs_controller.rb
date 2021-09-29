class GraphsController < ApplicationController
  include GraphsHelper

  def index
    @graph = current_user.graphs.first
    gon.cigarette_records = Graph.chart_data(current_user)
    # 記録済みの日付データ
    gon.recorded_dates = current_user.graphs.map(&:date)
    @total_monthly_cigarettes = total_monthly_cigarettes
    @average = (@total_monthly_cigarettes.to_f/monthly_graphs.count).round(1)
    @profile = current_user.profiles.first
    if @profile.nil?
    else
      @actual_monthly_cost = (@total_monthly_cigarettes*@profile.box_price/NUMBER_OF_CIGARETTES_IN_A_BOX).to_i
      @ordinary_monthly_cost = (@profile.box_price/NUMBER_OF_CIGARETTES_IN_A_BOX.to_f*@profile.cigar_amount*monthly_graphs.count).to_i
      @monthly_saved_cigarettes = (@profile.cigar_amount*monthly_graphs.count)-@total_monthly_cigarettes
      @monthly_saved_money = @ordinary_monthly_cost-@actual_monthly_cost
      @monthly_prolonged_life = ((@profile.cigar_amount.to_f*monthly_graphs.count-@total_monthly_cigarettes)*PROLONGED_MINUTES_PER_ONE_CIGARETTE/60).round(1)
    end
  end

  def create
    @graph = current_user.graphs.build(graph_params)
    date = @graph.date.strftime("%Y/%-m/%-d")
    if @graph.save
      flash[:notice] = "#{date}の記録を追加しました"
    else
      flash[:alert] = "エラーが発生しました"
    end
    redirect_to graphs_path
  end

  def update
    @graph = current_user.graphs.find_by(date: params[:graph][:date])
    date = @graph.date.strftime("%Y/%-m/%-d")
    if @graph.nil?
      flash[:alert] = "エラーが発生しました"
    elsif params[:_destroy].nil? && @graph.update(graph_params)
      flash[:notice] = "#{date}の記録を修正しました。"
    elsif params[:_destroy].present? && @graph.destroy
      flash[:alert] = "#{date}の記録を削除しました。"
    else
      flash[:alert] = "エラーが発生しました"
    end
    redirect_to graphs_path
  end

  private

  def graph_params
    params.require(:graph).permit(:date, :cigarette)
  end
end
