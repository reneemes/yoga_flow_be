# class User < ApplicationRecord
#   has_many :routine, dependent: :destroy
#   # has_many :routine_poses, through: :routines

#   VALID_EMAIL_REGEX = /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/

#   validates :name, presence: true
#   validates :email, format: { with: VALID_EMAIL_REGEX, message: "must be a valid email address" }, presence: true, uniqueness: true
#   # validates :email, presence: true, uniqueness: true
#   validates :password, presence: { require: true }
#   has_secure_password

# end