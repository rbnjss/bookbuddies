class GroupRegistration < ActiveRecord::Base
  belongs_to :profile
  belongs_to :group
end
