class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # def new
  #   super
  #    @token = params[:invite_token]
  # end

  # POST /resource
  # def create
  #   redirect_to new_profile_path(:user_id => @user)
  # end
  
  # def create
  #   super do |resource|
  #     if resource.save
  #       @token = params[:invite_token]
  #       if @token != nil
  #          org =  Invite.find_by_token(@token).user_group #find the user group attached to the invite
  #          resource.user_group.push(org) #add this user to the new user group as a member
  #       else
  #         # do normal registration things #
  #       end
  #     end
  #   end
  # end
  
  # def create
  #   @newUser = User.create(user_params)
  #   @token = params[:invite_token]
  #   if @token != nil
  #      org =  Invite.find_by_token(@token).group #find the user group attached to the invite
  #      @newUser.groups.push(org) #add this user to the new user group as a member
  #   else
  #     render :new
  #   end
  # end
  
  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update_resource(resource, params)
    if current_user.provider == "twitter"
      params.delete("current_password")
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   edit_profile_path
  # end

  # def after_sign_in_path_for(user)
  #   root_path
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private

  # def user_params
  #   params.require(:user).permit(:email, :encrypted_password, :reset_password_token, :provider, :uid, :invite_token)
  # end
    # def sign_up_params
    #   params.require(:user).permit(:email, :password, :password_confirmation)
    # end

    # def account_update_params
    #   params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
    # end
end
