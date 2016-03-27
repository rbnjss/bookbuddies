class Group < ActiveRecord::Base
	has_many :group_registrations
	has_many :users, through: :group_registrations
	has_many :books, :dependent => :destroy
	has_many :invites

	validates :group_name, presence: true,
												uniqueness: true

	accepts_nested_attributes_for :books, :allow_destroy => true
end
