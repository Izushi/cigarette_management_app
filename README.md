# タバコマネージャー

**『「なんとなく吸うか」はもうやめよう』** をテーマに開発した減煙サポートアプリです。

## URL

https://cigarette-manager.herokuapp.com

トップページのゲストログインボタンを押すとサインインせず閲覧可能

## アプリの特徴

- 毎日の喫煙本数がグラフ化され視覚的に喫煙習慣を見直すことができる
- 減煙による節約額や延びた寿命が算出されモチベーションを維持しながら継続できる
- 吸ったタバコのレビューができる

## アプリの開発背景

気づいたら一昨日買ったばかりのタバコが残り 2 本。自分の喫煙習慣を見直したいと思ったのがタバコマネージャーを開発しようと思ったきっかけです。

喫煙者の方の意見を聞いていると「禁煙したいとは思わないけど、量は減らしたい。」という声が意外にも多くありました。思えば世の中に禁煙アプリは多く存在しますが、減煙をテーマにしたアプリは中々無いのではないでしょうか。そんな減煙にフォーカスしたアプリを開発しました。

## ユーザーへの思い

タバコマネージャーは喫煙習慣の見直しと喫煙量の削減をサポートするアプリです。

吸ったタバコの本数を登録すると喫煙日と喫煙本数の関係がグラフ化されます。
この機能により視覚的に喫煙習慣を見直すことができ、また減っていく喫煙量に達成感を感じることができるでしょう。
ただし、減っていくタバコに喜びを感じるのは最初のうちだけかもしれません。タバコマネージャーは削減した喫煙量を維持していただくために減煙による節約額と延びた寿命を自動で計算し表示する機能を設けました。

このアプリで「無駄タバコ」を減らすことへの意義を見出し、より良い喫煙習慣を目指していただきたいです。

## こだわった点

アプリを開発するにあたってこだわった点は実際に周りの喫煙者の方々に使用していただき、たくさんのレビューをもとに改良してきた点です。

例えばアプリの特性上スマホで使用することがほとんどなので、よく使う喫煙本数の登録ボタンは右の親指で押しやすい位置に配置にすること、減煙のモチベーション維持のために節約額を表示することなど、一人で黙々と作成していたら気づかないユーザー目線のアドバイスを多く反映してきました。

このようなプロセスはどのようなサービスを開発するにも共通する点であり実務でも活きる良い経験になりました。

## 工夫した点

**全体**

- 存在しないデータにアクセスされた場合、トップページにリダイレクトされる処理を書いた
- データがない場合、データの登録を促す文言が表示されるようにした
- スマホでの使用が主であるためレスポンシブデザインを意識した

**コード**

- ヘルパーメソッドや部分テンプレートを利用し、コードの可読性と管理性を意識した
- マジックナンバーを使用しないよう自分にしかわからない数字は定数化した

**トップページ**

- 未ログインでも閲覧できるようにした
- ゲストログイン機能
- ユーザーの声

**減煙記録ページ**

- 記録の手間を省くためログイン後減煙記録ページに遷移するようにした
- アプリの仕様上基本スマホでの登録となるため、喫煙本数の登録ボタンを右手の親指で押しやすい位置に配置した
- 喫煙本数の登録日はデフォルトで当日にした
- 月ごとにデータを参照できるようにした

**プロフィールページ**

- fontawesome のアイコンを用いた
- 強調したいデータにマーカーを引いた

**コレクションページ**

- 最新のスマホの写真データサイズでも登録できるように 5MB まで対応できるバリデーションを書いた

## 使用技術

- 言語：Ruby (2.7.2)
- フレームワーク：Ruby on Rails (5.2.4)
- フロントエンド：HTML/Scss/JavaScript
- DB：PostgreSQL
- インフラ：Heroku
- ソースコード管理：GitHub
- 開発環境：MacOS/Visual Studio Code

## 機能一覧

- ログイン・ログアウト機能（devise）
- ユーザー登録・編集機能（devise）
- ゲストログイン機能
- グラフ表示機能（Chart.js）
- カレンダー機能（flatpickr）
- 喫煙本数登録、編集、削除機能
- プロフィール登録、編集、削除機能
- コレクション登録、編集、削除機能
- 画像投稿機能（carrierwave/mini-magick）
- 日本語化（rails-i18n）
- エラー・フラッシュ表示機能
- レスポンシブデザイン（Bootstrap）

## 使い方

## グラフページの使い方

### 喫煙本数の登録

![喫煙本数の登録](https://user-images.githubusercontent.com/70506409/132090460-b485a0e9-2c68-47ed-a1ad-0f205567ab0a.gif)

画面右中央インディゴの喫煙本数の登録ボタンを押す。モーダルが表示されるので日付を選択し喫煙本数を登録する。日付はデフォルトで当日になっている。

---

### 喫煙本数の編集・削除

![喫煙本数の修正・削除](https://user-images.githubusercontent.com/70506409/132090559-dcf3902a-1093-4a8e-89d3-71e0a3d6cf40.gif)

画面左中央グレーの喫煙本数の修正ボタンを押し編集または削除したいデータの日付を選択する。編集したい場合は喫煙本数を変更し、修正ボタンを押す。削除したい場合は日付選択後、削除ボタンを押す。

---

### グラフの表示期間を指定

![グラフの表示期間](https://user-images.githubusercontent.com/70506409/132090672-4ba13181-b305-4a4f-9bce-92e3a2fd0555.gif)

グラフはデフォルトで当日から 1 ヶ月前までのデータを表示している。グラフの表示期間を指定したい場合は画面最上部の開始と終了欄の日付を変更することで、グラフの表示範囲の指定ができる。

---

### 月ごとのレコード

グラフの下部には、月間合計喫煙本数と月間平均喫煙本数が表示されている。デフォルトでは当月のレコードが表示されているが、レコード下部の月次月前ボタンで過去の月間記録を確認することができる。

---

<br>

## プロフィールページの使い方

### 喫煙情報の登録

![プロフィールの登録](https://user-images.githubusercontent.com/70506409/132091679-02e3210e-4d65-4c3d-b18c-15cc1d47e0ca.gif)

プロフィールを登録ボタンを押しタバコ一箱の金額と普段の喫煙本数を登録する。するとプロフィール情報とグラフページで登録した実際の喫煙本数との関係から、**今まで我慢したタバコ**、**今まで節約した金額**、**延びた寿命**が表示される。

![プロフィール登録後のレコード](https://user-images.githubusercontent.com/70506409/132091690-0c1f165e-ffe7-47a1-8a99-ccb38155ff9c.gif)

またプロフィールを登録することで、グラフページの月ごとのレコードに今月の我慢したタバコ、今月の出費、今月の節約した金額、今月の延びた寿命の情報が追加で表示される。

---

### 喫煙情報の編集・削除

![プロフィールの修正・削除](https://user-images.githubusercontent.com/70506409/132091709-602a728e-dab7-4d89-abfa-6a9cdf0072ab.gif)

プロフィールを編集ボタンを押しタバコ一箱の金額と普段の喫煙本数を編集する。削除したい場合はプロフィールを削除ボタンを押す。プロフィールを削除するとグラフページのレコードの追加情報もともに表示されなくなる。

---

<br>

## コレクションページの使い方

### コレクションの登録

![コレクションの登録](https://user-images.githubusercontent.com/70506409/132092625-09bdb037-a954-4b20-a182-1359ac1adbe9.gif)

コレクションの登録ボタンを押す。画像、銘柄、一箱の値段、メモを登録する。画像は 5MG まで登録可能で銘柄と一箱の値段は記入必須。メモは最大 200 文字まで記入可能。コレクションページには画像、銘柄、値段が表示され、銘柄を押すとタバコ情報ページに遷移する。メモはタバコ情報ページから確認可能。

---

### タバコ情報の編集・削除

![コレクションの修正・削除](https://user-images.githubusercontent.com/70506409/132092180-8911beac-becb-4cfa-989a-0150397d8fee.gif)

編集したいデータのタバコ情報ページに遷移し、タバコ情報を編集ボタンを押す。編集したら更新ボタンを押し編集完了。
コレクションページのゴミ箱ボタンを押すと該当するデータが削除される。

---

## 追加予定の機能

- 目標設定機能
- AWS S3 を画像の保存先として設定
- テスト（RSpec）
