class Metum < ApplicationRecord
  belongs_to :metable, polymorphic: true, optional: true
  mount_uploader :og_image, ImageUploader

  # find associated page
  def self.find_page page
    where(page: page).first
  end
  
end
