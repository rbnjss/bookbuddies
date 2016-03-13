class BooksController < ApplicationController
before_action :set_book, only: [:show, :edit, :update, :destroy]
before_action :set_group


	def index
		@books = Book.all
	end

	def new
    @book = Book.new
	end

	def create
    @book = @group.books.build(book_params)
    if @book.save
      redirect_to @group
    else
      render :new
      # flash.now[:danger] = "error"
    end
  end

	def update
		@book.update(book_params)
		redirect_to book_path
	end

	def destroy
	  @book.destroy
	  respond_to do |format|
	    format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
	    format.json { head :no_content }
	  end
	end

private

	def set_book
	  @book = Book.find(params[:id])
	end

	def set_group
    @group = Group.find(params[:group_id])
  end

	def book_params
	  params.require(:book).permit(:book_name, :description, :author, :group_id)
	end

	def group_params
    params.require(:group).permit(:id, :group_id, :group)
  end

end
