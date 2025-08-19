class User < ApplicationRecord
  before_save { self.email = email.downcase }

  has_many :routines, dependent: :destroy
  has_many :routine_poses, through: :routines

  VALID_EMAIL_REGEX = /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/

  validates :name, presence: true
  validates :email, 
    presence: true,
    format: { with: VALID_EMAIL_REGEX, message: "must be a valid email address" },
    uniqueness: { case_sensitive: false }
  has_secure_password
end