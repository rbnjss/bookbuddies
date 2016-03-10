class BooksController < ApplicationController
before_action :set_book, only: [:show, :edit, :update, :destroy]


	def new
		@book = Book.new
	end

	def create
		
	end

private

	def set_book
	  @book = Book.find(params[:id])
	end

	def book_params
	  book_params = params.require(:book).permit(:book_name, :description, :author)
	end

end
