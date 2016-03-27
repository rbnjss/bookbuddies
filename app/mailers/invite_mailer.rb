class InviteMailer < ApplicationMailer
	default from: "hamillrobin@gmail.com"
	# !! Change this to MailGun address later

	def book_group_invite
		mail  to: :email,
					subject: "Book buddies group invitation"
	end

end
