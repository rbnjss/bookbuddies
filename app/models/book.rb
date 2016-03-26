class Book < ActiveRecord::Base
	has_attached_file :cover
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

	belongs_to :group
	has_many :comments, :dependent => :destroy

	has_attached_file :cover, styles: { medium: "300x300>", thumb: "100x100>" }
	validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/
end
