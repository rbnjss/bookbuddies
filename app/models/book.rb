class Book < ActiveRecord::Base
	has_attached_file :cover
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

	belongs_to :group
	has_many :comments
end
