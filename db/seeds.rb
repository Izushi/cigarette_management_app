EMAIL = "guest@example.com"
PASSWORD = "password"

# データの入力範囲
START_DATE = Date.today - 12.months
END_DATE = Date.yesterday

# 記録する喫煙本数の範囲
MIN_CIGARETTE = 0
MAX_CIGARETTE = 20

user = User.find_or_create_by!(email: EMAIL) do |user|
  user.password = PASSWORD
end
puts "テストユーザーの初期データインポートに成功しました。"

user.graphs.destroy_all

graphs = []
(START_DATE..END_DATE).each do |date|
  graphs << {
    user_id: user.id,
    date: date,
    cigarette: rand(MIN_CIGARETTE..MAX_CIGARETTE),
  }
end
Graph.create!(graphs)
puts "喫煙本数の初期データ投入に成功しました！"