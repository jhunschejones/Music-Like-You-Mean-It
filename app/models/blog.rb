class Blog < ApplicationRecord
  has_many :tags
  has_rich_text :content

  validates :title, presence: true
end
