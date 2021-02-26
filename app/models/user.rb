class User < ApplicationRecord
  rolify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  has_many :courses

  after_create :assign_default_role

  def to_s
    email
  end

  def username
    email.split(/@/).first
  end

  private

  def assign_default_role
    self.add_role(:student) if self.roles.blank?
    self.add_role(:teacher)
  end
end
