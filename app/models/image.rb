class Image < ApplicationRecord
  validates_presence_of :name
  validates :image_file, presence: true

  has_one_attached :image_file do |attachable|
    attachable.variant :thumb, resize_to_limit: [ 100, 100 ], preprocessed: true
    attachable.variant :labelling, resize_to_limit: [ 1200, 800 ], preprocessed: true # Fitting to screen for labelling ([width, height])
  end
end
