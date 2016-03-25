class CommentsController < ApplicationController

	def create
		# @book = Book.find(params[:id])
		@comment = Comment.create(comment_params)
		if @comment.save
		      redirect_to :back
		    else
		      flash.now[:danger] = "error"
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
    params.require(:comment).permit(:id, :content, :profile_id, :book_id)
  end

end
