class User < ApplicationRecord
  has_secure_password
  encrypts :email, :name
  blind_index :email, :name

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true
  validate :site_role_valid

  SITE_USER = "user".freeze
  SITE_ADMIN = "admin".freeze
  USER_SITE_ROLES = [SITE_USER, SITE_ADMIN].freeze

  private

  def site_role_valid
    unless USER_SITE_ROLES.include?(site_role)
      errors.add(:site_role, "not included in '#{USER_SITE_ROLES}'")
    end
  end
end
