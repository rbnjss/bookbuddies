class InvitesController < ApplicationController

  def new
    @invite - Invite.new
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
         @invite.recipient.groups.push(@invite.group)
      else
         InviteMailer.new_user_invite(@invite, new_user_registration_path(:invite_token => @invite.token)).deliver
         # Fix redirect
      end
    else
       # oh no, creating an new invitation failed
    end
  end

  def invite_params
    params.require(:invite).permit(:email, :sender_id, :recipient_id, :token, :group_id)
  end
end