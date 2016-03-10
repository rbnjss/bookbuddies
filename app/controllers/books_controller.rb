class BooksController < ApplicationController
before_action :set_book, only: [:show, :edit, :update, :destroy]


	def index
		@book = Book.all
	end

	def new
		@book = Book.new
	end

	def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

	def update
		@book.update(book_params)
		redirect_to book_path
	end

private

	def set_book
	  @book = Book.find(params[:id])
	end

	def book_params
	  book_params = params.require(:book).permit(:book_name, :description, :author)
	end

end
