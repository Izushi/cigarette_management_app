module GraphsHelper
  def month
    # parseメソッドで文字列DateクラスをDateオブジェクトに変換
    # 今日を含む月を取得
    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
  end

  # 取得した時刻が含まれる月の範囲のgraphsテーブルのデータを取得
  def cigarettes_this_month
    current_user.graphs.where(date: month.all_month)
  end

  # 月の合計喫煙本数
  def sum_cigarette_this_month
    sum = 0
    cigarettes_this_month.each { |n| sum += n.cigarette }
    sum
  end
end
