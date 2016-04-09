class NotificationMailer < ApplicationMailer
	require 'mailgun'

	default from: "bookbuddies@sandboxdb186207bc4648cb947c92d270219a9e.mailgun.org"

	def notification_email(user, comment, book_name, book_id)
		@user = user
		@comment = comment
		@book_name = book_name
		@book = book_id
		mail to: @user.email, subject: "Bookbuddies: One of your buddies made a new comment!"
	end
end
