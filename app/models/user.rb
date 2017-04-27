require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt

  validates :name, presence: true, uniqueness: true, length: { minimum: 2 }
  validates :email, presence: true
  validate :name_capitalized
  has_many :statuses, dependent: :destroy
  has_many :groups_users, dependent: :destroy
  has_many :groups, through: :groups_users

  def name_capitalized
    errors.add(:name, 'is not capitalized') unless name && name.capitalize == name
  end

  # handle a nil password_hash
  def password
    @password ||= Password.new(password_hash) unless password_hash.nil?
  end

  def password=(new_password)
    @password = Password.create(new_password) unless new_password.nil?
    self.password_hash = @password
  end
end
