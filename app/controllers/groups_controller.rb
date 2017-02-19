class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_has_profile
  before_action :authenticate_user!
  before_action :ensure_registration!, only: [:show]

  def ensure_registration!
    if !current_user.groups.include?(@group)
      flash[:error] = "You don't belong to this group"
      redirect_to groups_path
    end
  end
  
  
  def index
    @groups = Group.all
    @grs = GroupRegistration.where(user_id: current_user.id)
    @favorites = current_user.favorites.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      @gr = @group.group_registrations.build(user_id: current_user.id)
      @gr.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def show
    @members = @group.group_registrations.all
    @invite = Invite.create
    # @gr = GroupRegistration.find_by(user_id: current_user.id, group_id: @group.id)
  end

  def edit
    
  end

  def update
    @group.update(group_params)
    redirect_to group_path
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_path, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
    # redirect_to root_path
  end

  private

    def set_group
      @group = Group.find(params[:id])
    end
    
    def group_params
      group_params = params.require(:group).permit(:group_name, :description, :location, :group_image, :meetup_location)
    end
end
