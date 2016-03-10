class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  def index
    @groups = Group.all
  end

  def show
  end

  def edit
  end

  def update
    @group.update(group_params)
    redirect_to root_path
  end

  def new
    @group = Group.new
  end

  def create
      @group = Group.new(group_params)
      if @group.save
        redirect_to root_path
      else
        render :new
      end
    end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to root_path
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end
    
    def group_params
      group_params = params.require(:group).permit(:group_name, :description, :location)
    end
end
