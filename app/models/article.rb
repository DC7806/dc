class Article < ApplicationRecord

  validates :title, :description, :permalink, :content, presence: true

  before_save :default_values

  has_one :image, as: :imagable, dependent: :destroy
  accepts_nested_attributes_for :image, allow_destroy: true
  has_one :metum, as: :metable, dependent: :destroy
  accepts_nested_attributes_for :metum, allow_destroy: true
  has_and_belongs_to_many :categories

  def self.search query
    where("LOWER(title) LIKE ? OR LOWER(description) LIKE ?",
          "%#{query.downcase}%", "%#{query.downcase}%")
  end

  private

  def default_values
    self.permalink.parameterize = title if self.permalink.blank?
    self.metum.og_title = title if self.metum.og_title.blank?
    self.metum.og_description = description if self.metum.og_description.blank?
  end

end
