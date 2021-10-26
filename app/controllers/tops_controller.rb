class TopsController < ApplicationController
  # ログインしていなくても閲覧できる処理
  skip_before_action :authenticate_user!, only: %i[index]

  def index
  end
end
