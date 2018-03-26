class Category < ApplicationRecord
  
  validates :name, uniqueness: true

  before_save :default_value

  has_one :image, as: :imagable, dependent: :destroy
  accepts_nested_attributes_for :image, allow_destroy: true
  has_one :metum, as: :metable, dependent: :destroy
  accepts_nested_attributes_for :metum, allow_destroy: true

  has_and_belongs_to_many :articles

  private

  def default_value
    self.permalink.parameterize = name if self.permalink.blank?
  end

end
