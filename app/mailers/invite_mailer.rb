class InviteMailer < ApplicationMailer
	default from: "hamillrobin@gmail.com"
	# !! Change this to MailGun address later

	new_user_registration_path(:invite_token => @invite.token) #new_user_registration_path is a Devise path. Use the correct registration route for your app
	#outputs -> http://yourapp.com/users/sign_up?invite_token=075eeb1ac0165950f9af3e523f207d0204a9efef

	def book_group_invite
		mail  to: :email,
					subject: "Book buddies group invitation"
	end

end
