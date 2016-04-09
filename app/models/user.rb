class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :omniauthable, :omniauth_providers => [:twitter]

  has_one :profile, :dependent => :destroy
  has_many :comments
  has_many :group_registrations, :dependent => :destroy
  has_many :groups, through: :group_registrations
  has_many :favorites
  has_many :invitations, :class_name => "Invite", :foreign_key => 'recipient_id'
  has_many :sent_invites, :class_name => "Invite", :foreign_key => 'sender_id'

  accepts_nested_attributes_for :profile
end
