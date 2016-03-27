class InviteMailer < ApplicationMailer
	default from: "hamillrobin@gmail.com"

	def book_group_invite
		mail  to: :email,
					subject: "Book buddies group invitation"
	end

end
