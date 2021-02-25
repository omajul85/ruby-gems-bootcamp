class Course < ApplicationRecord
  LEVELS = %i[Beginner Intermediate Advanced]
  LANGUAGES = %i[English Spanish French]
  has_rich_text :description

  belongs_to :user

  validates :title, :short_description, :language, :price, :level, presence: true
  validates :description, presence: true, length: { :minimum => 5 }

  def to_s
    title
  end

  class << self
    def languages
      LANGUAGES.map { |language| [language, language] }
    end

    def levels
      LEVELS.map { |level| [level, level] }
    end
  end
end
