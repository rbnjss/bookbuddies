class Group < ActiveRecord::Base
	
	has_many :group_registrations, :dependent => :destroy
	has_many :users, through: :group_registrations
	has_many :books, :dependent => :destroy
	has_many :invites, :dependent => :destroy

	has_attached_file :group_image, :default_url => '/assets/group.jpg', styles: { medium: "300x300>", thumb: "150x150>" }
	  validates_attachment_content_type :group_image, :content_type => /\Aimage\/.*\Z/

	validates :group_name, presence: true,
												uniqueness: true

	accepts_nested_attributes_for :books, :allow_destroy => true
end
