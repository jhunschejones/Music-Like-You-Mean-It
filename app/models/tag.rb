class Tag < ApplicationRecord
  belongs_to :blog

  validates :text, presence: true

  before_save :format_text

  private

  def format_text
    self.text = self.text.strip.capitalize
  end
end
