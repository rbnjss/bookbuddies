class Group < ActiveRecord::Base
	has_many :users
	has_many :books
	has_many :group_registrations

	validates :group_name, presence: true,
												uniqueness: true
end
