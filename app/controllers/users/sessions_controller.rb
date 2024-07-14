class Users::SessionsController < Devise::SessionsController
  def guest_sign_in
    user = User.guest
    sign_in user
    session[:guest_user_id] = user.id
    redirect_to lists_path, notice: "guestuserでログインしました"
  end
   def guest_sign_out
    session.delete(:guest_user_id)
    sign_out(User)
    redirect_to root_path, notice: "ゲストユーザーとしてログアウトしました"
  end
end