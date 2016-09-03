class User < ActiveRecord::Base

  has_secure_password

  validates_confirmation_of :password_digest
  validates_presence_of :password_digest, :on => :create
  validates_presence_of :username, :email
  validates_uniqueness_of :email, :username

  has_many :conversations, :foreign_key => :sender_id
  has_and_belongs_to_many :interests

end
