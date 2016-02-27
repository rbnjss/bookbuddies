class GroupsController < ApplicationController

	def index
		@groups = Group.all
	end

	def show
		@group = Group.find(params[:id])
	end

	def new
		@group = Group.new
	end

	def edit
		@group = Group.find(params[:id])
	end

	def create
		@group = Group.new(group_params)
		if @group.save
			redirect_to root_path
		else
			render :new
		end
	end

	def update
		@group = Group.find(params[:id])
		if @group.update(group_params)
			redirect_to root_path
		else
			render :edit
		end
	end

	def destroy
		@group = Group.find(params[:id])
		@group.destroy
		redirect_to root_path
	end

	def set_group
		@group = Group.find(params[:id])
	end

	def group_params
		group_params = params.require(:group).permit(:group_name, :book_name, :author, :avatar, :bio, :city)
	end

end
