class GroupRegistrationsController < ApplicationController
  
  def destroy
		@gr = GroupRegistration.find_by(user_id: params[:user_id], group_id: params[:group_id])
		@fav = Favorite.where(user_id: current_user.id, book_id: @gr.group.books)
		if @fav != nil
			@fav.each do |fav|
				fav.destroy
			end
		end
		@gr.destroy
		respond_to do |format|
		  format.html { redirect_to :groups, notice: 'Registration was successfully destroyed.' }
		  format.json { head :no_content }
		end
	end

end
