class Users::SessionsController < Devise::SessionsController
  def guest_sign_in
    # ゲストアカウントでログイン
    sign_in User.guest
    # トップページへリダイレクト
    redirect_to graphs_path, notice: "ゲストユーザーとしてログインしました。"
  end
end