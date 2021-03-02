class User < ApplicationRecord
  rolify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  has_many :courses

  after_create :assign_default_role

  validate :must_have_a_role, on: :update

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

  def must_have_a_role
    if roles.blank?
      errors.add(:roles, 'must have at least one role')
    end
  end
end
