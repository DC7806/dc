class Metum < ApplicationRecord
  belongs_to :metable, polymorphic: true, optional: true
  mount_uploader :og_image, ImageUploader
end
