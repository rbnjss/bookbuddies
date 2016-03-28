class InvitesController < ApplicationController

  def new
    @invite - Invite.new
  end

  def update
    
  end

  def create
    @invite = Invite.new(invite_params)
    @invite.sender_id = current_user.id
    if @invite.save

      #if the user already exists
      if @invite.recipient != nil 

         #send a notification email
         InviteMailer.existing_user_invite(@invite).deliver 

         #Add the user to the user group
         @invite.recipient.user_groups.push(@invite.user_group)
      else
         InviteMailer.new_user_invite(@invite, new_user_registration_path(:invite_token => @invite.token)).deliver
      end
    else
       render text: "Go back! There's been an error"
    end
end