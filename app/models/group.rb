class Group < ActiveRecord::Base
	
	has_many :group_registrations, :dependent => :destroy
	has_many :users, through: :group_registrations
	has_many :books, :dependent => :destroy
	has_many :invites, :dependent => :destroy

	has_attached_file :group_image, :default_url => ActionController::Base.helpers.asset_path('group.jpg'), styles: { large: "1440x250#", medium: "275x275#", thumb: "150x150>" }
	  validates_attachment_content_type :group_image, :content_type => /\Aimage\/.*\Z/

	validates :group_name, presence: true
	validates :location, presence: true

	accepts_nested_attributes_for :books, :allow_destroy => true

	def desc_truncate
		if self.description.length > 150
			self.description.first(150).to_s + "..."
		else
			self.description
		end
	end

end
