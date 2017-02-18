class JoinsController < ApplicationController
	before_action :invite_session
	before_action :authenticate_user!

	def invite_session
		session[:invite_token] = params[:invite_token]
	end

	def join
		@token = params[:invite_token]
		if @token == nil
			redirect_to groups_path
		else
			org =  Invite.find_by_token(@token).group_id #find the user group attached to the invite
			@gr = GroupRegistration.new(user_id: current_user.id, group_id: org)
	    @gr.save
	    session[:invite_token] = nil
			redirect_to groups_path
		end
	end

end
