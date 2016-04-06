class GroupRegistrationsController < ApplicationController
  
  def destroy
		@gr = GroupRegistration.find_by(user_id: params[:user_id], group_id: params[:group_id])
		@gr.destroy
		respond_to do |format|
		  format.html { redirect_to :groups, notice: 'Registration was successfully destroyed.' }
		  format.json { head :no_content }
		end
	end

end
