class Category < ApplicationRecord
  
  validates :name, uniqueness: true

  before_save :default_value

  has_and_belongs_to_many :articles

  private

  def default_value
    self.permalink.parameterize = name if self.permalink.blank?
  end

end
