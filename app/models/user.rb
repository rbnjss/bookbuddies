class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :omniauthable, :omniauth_providers => [:twitter]

  has_one :profile
  has_many :comments
  has_many :group_registrations
  has_many :groups, through: :group_registrations

  accepts_nested_attributes_for :profile
end
