class InviteMailer < ApplicationMailer
	require 'mailgun'

	default from: "bookbuddies@sandboxdb186207bc4648cb947c92d270219a9e.mailgun.org"

	def new_user_invite(invite, inviteURL)
		mail  to: :email,
					subject: "Book buddies group invitation"
	end

	def existing_user_invite
		mail  to: :email,
					subject: "Book buddies group invitation"
	end

end
