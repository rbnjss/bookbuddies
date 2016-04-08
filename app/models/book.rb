class Book < ActiveRecord::Base
	has_attached_file :cover
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

	belongs_to :group
	has_many :comments, :dependent => :destroy
	has_many :favorites, :dependent => :destroy

	has_attached_file :cover, :default_url => 'book.jpg', styles: { medium: "175x200#", thumb: "150x175#" }
	validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/
end
