class Notification < ActiveRecord::Base
  belongs_to :book
  belongs_to :comment
  belongs_to :user
end
