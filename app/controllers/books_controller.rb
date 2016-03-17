class BooksController < ApplicationController
before_action :set_book, only: [:show, :edit, :update, :destroy]
before_action :set_group, only: [:edit, :new]


	def index
		@books = Book.all
	end

	def show
		
	end

	def new
    @book = Book.new
	end

	def create
    # @book = @group.books.build(book_params)
    @book = Book.create(book_params)
    if @book.save
      redirect_to books_path(@book)
    else
      render :new
    end
  end

  def edit

  end

	def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_path, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

	def destroy
	  @book.destroy
	  respond_to do |format|
	    format.html { redirect_to books_path, notice: 'Book was successfully destroyed.' }
	    format.json { head :no_content }
	  end
	end

private

	def set_group
    @group = Group.find(params[:group_id])
  end

	def set_book
	  @book = Book.find(params[:id])
	end

	def book_params
	  params.require(:book).permit(:book_name, :description, :author, :group_id)
	end

	def group_params
    params.require(:group).permit(:id, :group_id, :group)
  end

end
