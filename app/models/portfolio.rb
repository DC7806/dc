class Portfolio < ApplicationRecord
  validates :title, presence: true

  has_one :image, as: :imagable, dependent: :destroy
  accepts_nested_attributes_for :image, allow_destroy: true

  after_save :alt_default_value

  private

  def alt_default_value
    self.image.update(alt: title.downcase) if self.image.alt.blank?
  end
  
end
