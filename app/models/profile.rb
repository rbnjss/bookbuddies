class Profile < ActiveRecord::Base
	validates :user, presence: true

	has_many :comments
	has_many :group_registrations
	belongs_to :user
end
