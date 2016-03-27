class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!
  
  
  def index
    @groups = Group.all
    @grs = GroupRegistration.where(profile_id: current_user.profile.id)
  end

  def show
    @members = @group.group_registrations.all
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
      @gr = @group.group_registrations.build(profile_id: current_user.profile.id)
      @gr.save
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
