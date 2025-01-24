class ImageLabel < ApplicationRecord
  belongs_to :image

  validates_presence_of :left
  validates_presence_of :top
  validates_presence_of :width
  validates_presence_of :height
  validates_presence_of :label_name
end
