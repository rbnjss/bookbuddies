class CommentsController < ApplicationController

	def create
		@comment = Book.comments
	end

	def destroy
		
	end

private

	def comment_params
    params.require(:comment).permit(:id, :content, :profile_id, :book_id)
  end

end
