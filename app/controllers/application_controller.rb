class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # マジックナンバーの定義
  NUMBER_OF_CIGARETTES_IN_A_BOX = 20
  PROLONGED_MINUTES_PER_ONE_CIGARETTE = 5

  # サインイン後はグラフページに遷移
  def after_sign_in_path_for(resource)
    graphs_path
  end

  # 存在しないデータにアクセスした場合トップページにリダイレクト
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_to_toppage

  def redirect_to_toppage
    redirect_to root_path, alert: 'データが見つかりません'
  end

  # 全ての例外に対応する処理
  # rescue_from StandardError, with: :rescue_exeption

  # def rescue_exeption(e = nil)
  #   if e
  #     logger.info "StandardError!: #{e.message}"
  #     logger.info e.backtrace.join("\n")
  #   end
  #   redirect_to root_path
  # end
end
