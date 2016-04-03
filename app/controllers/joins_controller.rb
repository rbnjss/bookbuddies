class JoinsController < ApplicationController

	def join
		@token = params[:invite_token]
	end

end
