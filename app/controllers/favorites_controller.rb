class FavoritesController < ApplicationController
	before_action :set_book

	def create
    if Favorite.create(book_id: @book.id, user_id: current_user.id)
      redirect_to @book, notice: 'Book has been favorited'
    else
      redirect_to @book, alert: 'Something went wrong...*sad panda*'
    end
  end
  
  def destroy
    Favorite.where(book_id: @book.id, user_id: current_user.id).first.destroy
    redirect_to @book, notice: 'Book is no longer in favorites'
  end

private

	def favorite_params
	  params.require(:favorite).permit(:user_id, :book_id)
	end

	def set_book
	  @book = Book.find(params[:book_id])
	end

end
