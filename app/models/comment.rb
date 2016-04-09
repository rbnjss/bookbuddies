class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates :content, presence: true

  	def user_name
  		self.user.profile.first_name + " " + self.user.profile.last_name
  	end
end
