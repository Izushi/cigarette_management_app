module GraphsHelper
  def month
    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
  end

  def cigarettes_this_month
    @cigarettes_this_month = current_user.graphs.where(date: month.all_month)
  end

  def sum_cigarette_this_month
    sum = 0
    cigarettes_this_month
    @cigarettes_this_month.each { |n| sum += n.cigarette }
    sum
  end
end
