class Book < ActiveRecord::Base
	belongs_to :group
	has_many :groups
	has_many :comments
end
