class Profile < ActiveRecord::Base
	has_many :comments
	has_many :group_registrations
	has_many :groups, through: :group_registrations
	belongs_to :user
end
