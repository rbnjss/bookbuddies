class Profile < ActiveRecord::Base
	has_many :comments
	has_many :group_registrations
	has_many :groups, through: :group_registrations
	belongs_to :user

	has_attached_file :avatar, :default_url => 'user.jpg', styles: { medium: "300x300>", thumb: "100x100>" }
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
