EMAIL = "guest@example.com"
PASSWORD = "password"

# データの入力範囲
START_DATE = Date.today - 11.months
END_DATE = Date.today + 1.months

# 1/(NO_RECORD_CONSTANT) の確率でデータを記録しない
# （記録が一部欠けていてもグラフが正常に描けるかをチェックするため）
# NO_RECORD_CONSTANT = 5

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
  # 1/(NO_RECORD_CONSTANT) の確率でデータを入れる操作をスキップ
  # next if rand(NO_RECORD_CONSTANT).zero?
  graphs << {
    user_id: user.id,
    date: date,
    cigarette: rand(MIN_CIGARETTE..MAX_CIGARETTE),
  }
end
Graph.create!(graphs)
puts "喫煙本数の初期データ投入に成功しました！"

user.cigar_infos.destroy_all

user.cigar_infos.create!(brand: "マルボロ・メンソール", price: "570")
user.cigar_infos.create!(brand: "ラッキーストライク・チルベリー", price: "400")
user.cigar_infos.create!(brand: "アメスピ・ゴールド", price: "570")
user.cigar_infos.create!(brand: "ケント・スパーク・メロー", price: "480")
user.cigar_infos.create!(brand: "キャメル・ベリーカプセル", price: "450")
user.cigar_infos.create!(brand: "ピース・ライト", price: "560")
puts "タバコ情報の登録に成功しました！"