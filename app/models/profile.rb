class Profile < ActiveRecord::Base
	has_many :group_registrations
end
