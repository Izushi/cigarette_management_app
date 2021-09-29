module GraphsHelper
  def month
    # parseメソッドで文字列DateクラスをDateオブジェクトに変換
    # 今日を含む月を取得
    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
  end

  # 取得した時刻が含まれる月の範囲のgraphsテーブルのデータを取得
  def monthly_graphs
    current_user.graphs.where(date: month.all_month)
  end

  # 月の合計喫煙本数
  def total_monthly_cigarettes
    sum = 0
    monthly_graphs.each { |n| sum += n.cigarette }
    sum
  end
end
