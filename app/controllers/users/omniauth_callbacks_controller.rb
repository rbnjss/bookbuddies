class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    # Find a user with a provider and UID matching request.env["omniauth.auth"]
    provider = request.env["omniauth.auth"]["provider"]
    uid = request.env["omniauth.auth"]["uid"]

    # If that user exists, sign them in
    # If they don't, create them
    @user = User.where(uid: uid, provider: provider).first_or_initialize

    # @user.profile.create(
    #   name: request.env["omniauth.auth"]["info"]["name"]
    # )

    def twitter_submit
      provider = params[:user][:provider]
      uid = params[:user][:uid]

      @user = User.where(uid: uid, provider: provider).first_or_initialize
      @user.password = SecureRandom.uuid

      if @user.update(user_params)
        sign_in_and_redirect @user
      else    
        render :twitter   
      end
    end

    def user_params
      params.require(:user).permit(:email)
    end
  end
  
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
