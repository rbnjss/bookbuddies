class ProfilesController < ApplicationController
	  before_action :set_profile, only: [:show, :edit, :update, :destroy]

	  def show
	  	
	  end

	  def new
	    @profile = Profile.new
	  end

	  def edit
	  	set_profile
	  end

	  def create
	  	@profile = Profile.new(profile_params)
	    @profile.user_id = current_user.id

	    if @profile.save
	      redirect_to @profile
	    else
	      render :new
	    end
	  end

	  def update
	    @profile = Profile.new(profile_params)
	    @profile.user_id = current_user.id

	      if @profile.save
	        redirect_to @profile
	      else
	        render :new
	      end
	  end

	  def destroy
	  	
	  end

	private

	  def set_profile
	      @profile = current_user.profile
	      if @profile.nil?
	        @profile = Profile.new(user: current_user)
	      end
	      @profile
	  end

	  def profile_params
	    params.require(:profile).permit(:first_name, :last_name, :city, :bio)
	  end
end
