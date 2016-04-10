class ContactMailer < ApplicationMailer
	default to: 'rbnjssdev@gmail.com'

  	def send_mail(name, email, body)
		@name = name
    	@email = email
    	@body = body

    	mail(from: name, subject: 'New Contact Request from Bookbuddies')
  	end
end
