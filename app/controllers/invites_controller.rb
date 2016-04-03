class InvitesController < ApplicationController

  def new
  
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
        redirect_to :back
      else
         InviteMailer.new_user_invite(@invite, joins_path(:invite_token => @invite.token)).deliver
          redirect_to :back
         # Fix redirect
      end
    else
       render text: "Uh oh! An error!"
    end
  end

  def invite_params
    params.require(:invite).permit(:email, :sender_id, :recipient_id, :token, :group_id)
  end
end