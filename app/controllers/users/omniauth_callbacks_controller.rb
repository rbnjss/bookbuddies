class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    @user = User.where(uid: auth.uid, provider: auth.provider).first_or_initialize

    if @user.persisted?
      @user.update(token: auth.credentials.token, secret: auth.credentials.secret, avatar_url: auth.info.image)
      sign_in @user
      redirect_to groups_path
    else
      @user.token = auth.credentials.token
      @user.secret = auth.credentials.secret
      @user.avatar_url = auth.info.image
    end
  end

  def twitter_submit
    provider = params[:user][:provider]
    uid = params[:user][:uid]
    token = params[:user][:token]
    secret = params[:user][:secret]
    avatar_url = params[:user][:avatar_url]

    @user = User.where(uid: uid, provider: provider).first_or_initialize(token: token, secret: secret)
    @user.password = SecureRandom.uuid

    if @user.update(user_params)
      sign_in @user
      redirect_to edit_profile_path
    else    
      render :twitter
    end
  end

  def user_params
    params.require(:user).permit(:email)
  end

  def auth
    request.env["omniauth.auth"]
  end
end
