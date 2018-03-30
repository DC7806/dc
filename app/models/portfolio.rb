class Portfolio < ApplicationRecord
  validates :title, :content, presence: true
  validates :permalink, presence: true, uniqueness: true

  has_one :image, as: :imagable, dependent: :destroy
  accepts_nested_attributes_for :image, allow_destroy: true
  has_one :metum, as: :metable, dependent: :destroy
  accepts_nested_attributes_for :metum, allow_destroy: true
end
