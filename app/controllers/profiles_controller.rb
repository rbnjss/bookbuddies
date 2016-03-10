class ProfilesController < ApplicationController
  
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  
  def index
    @profiles = Profile.all
  end

  def show
  	
  end

  def new
    @profiles = Profile.new
  end

  def edit
  	
  end

  def create
  	@profile = Profile.new(profile_params)
    if @profile.save
      redirect_to @profile
    else
      render :new
    end
  end

  def update
  	@profile.update(profile_params)
  end

  def destroy
  	
  end

private

  def set_profile
      @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :city, :bio)
  end

end
