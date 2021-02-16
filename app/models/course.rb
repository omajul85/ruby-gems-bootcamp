class Course < ApplicationRecord
  has_rich_text :description

  belongs_to :user

  validates :title,  presence: true
  validates :description, presence: true, length: { :minimum => 5 }

  def to_s
    title
  end
end
