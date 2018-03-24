class Article < ApplicationRecord
  validates :title, :description, :permalink, :content, presence: true

  has_one :image, as: :imagable, dependent: :destroy
  accepts_nested_attributes_for :image, allow_destroy: true

end
