class ContactController < ApplicationController
	def send_mail
	    name = params[:name]
	    email = params[:email]
	    body = params[:comments]
	    ContactMailer.send_mail(name, email, body).deliver
	    redirect_to root_path
	end
end
