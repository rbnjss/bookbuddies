class CommentsController < ApplicationController

	def create
		@comment = Comment.create(comment_params)
		if @comment.save
			@book_name = @comment.book.book_name
			@book_id = @comment.book.id
			# Get a list of all users in this group
			@user_ids = GroupRegistration.where(group_id: @comment.book.group.id).pluck(:user_id)
			@users = User.find(@user_ids)
			# Send mailer to each user in the group
			@users.each do |user|
				if user.id != @comment.user_id
					NotificationMailer.notification_email(user, @comment, @book_name, @book_id).deliver
				end
			end
	      	redirect_to :back
	    else
	      redirect_to :back, notice: "Comment cannot be blank"
	    end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		respond_to do |format|
		  format.html { redirect_to :back, notice: 'Comment was successfully destroyed.' }
		  format.json { head :no_content }
		end
	end

private

	def comment_params
   		params.require(:comment).permit(:id, :content, :user_id, :book_id)
  	end
end
