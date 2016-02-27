class GroupsController < ApplicationController

	def index
		@groups = Group.all
	end

	def show
		
	end

	def new
		@group = Group.new
	end

	def edit
		
	end

	def create
		@group = Group.new(user_params)
	end

	def update
		
	end

	def destroy
		@group.destroy
	end

	private

	def set_group
		@group = Group.find(params[:id])
	end

	def user_params
		params.require(:group).permit(:first_name, :last_name, :user_name, :avatar, :bio, :city)
	end

end
