class User < ActiveRecord::Base

	has_many :groups
	has_many :comments

end
