class BooksController < ApplicationController
before_action :set_book, only: [:show, :edit, :update, :destroy]
before_action :set_group, only: [:index, :edit, :new]
before_action :authenticate_user!
before_action :ensure_registration!, only: [:show]

def ensure_registration!
  if !current_user.groups.include?(@book.group)
    flash[:error] = "You don't belong to this group"
    redirect_to root_path
  end
end


	def index
		@books = Book.where(group_id: @group.id).order(created_at: :desc)
	end

	def show
		@group = @book.group
		@comment = Comment.where(book_id: @book.id)
		@comments = @book.comments.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 5)
		@members = @book.group.group_registrations.all
		@favorite = Comment.where(book_id: @book.id, user_id: current_user.id)
		@city = current_user.profile.city.downcase
		@to_library = "http://www.torontopubliclibrary.ca/search.jsp?N=37906&Ntt="
	end

	def new
    	@book = Book.new
	end

	def create
    	@book = Book.create(book_params)
	    if @book.save
		  @group = @book.group
	      redirect_to group_path(@group)
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
	  @group = @book.group
	  respond_to do |format|
	    format.html { redirect_to group_path(@group), notice: 'Book was successfully destroyed.' }
	    format.json { head :no_content }
	  end
	end

private

	def set_book
	  @book = Book.find(params[:id])
	end

	def set_group
    @group = Group.find(params[:group_id])
    # @group = Group.find(params[:id])
  end

	def book_params
	  params.require(:book).permit(:book_name, :description, :author, :group_id, :cover)
	end

	def group_params
    params.require(:group).permit(:id, :group_id, :group)
  end

end
