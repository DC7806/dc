class Article < ApplicationRecord
  validates :title, :description, :permalink, :content, presence: true
end
