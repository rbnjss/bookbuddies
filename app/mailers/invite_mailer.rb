class InviteMailer < ApplicationMailer
	require 'mailgun'

	default from: "bookbuddies@sandboxdb186207bc4648cb947c92d270219a9e.mailgun.org"

	def new_user_invite(invite, inviteURL)
		@invite = invite
		@rootURL = "http://localhost:3000/"
		mail  to: @invite.email,
					subject: "Bookbuddies Group Invitation"
	end

	def existing_user_invite(invite)
		@invite = invite
		@rootURL = "http://localhost:3000/"
		mail  to: @invite.email,
					subject: "Bookbuddies Group Invitation"
	end

end
