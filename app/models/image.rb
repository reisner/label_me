class Image < ApplicationRecord
  has_many :image_labels
  accepts_nested_attributes_for :image_labels

  has_one_attached :image_file do |attachable|
    attachable.variant :thumb, resize_to_limit: [ 100, 100 ], preprocessed: true
    attachable.variant :labelling, resize_to_limit: [ 1200, 800 ], preprocessed: true # Fitting to screen for labelling ([width, height])
  end

  MAX_IMAGE_SIZE_IN_MB = 10.freeze
  validates_presence_of :name
  validates :image_file, presence: true
  validate :validate_acceptable_image

  def save_labels(label_params)
    ImageLabel.transaction do
      self.image_labels.destroy_all
      label_params.each do |id, attributes|
        self.image_labels.create! attributes # .except(:symbol_entry_name)
      end

      self.save!
    end

    true
  end

  private

  def validate_acceptable_image
    return unless image_file.attached?

    unless image_file.blob.byte_size <= MAX_IMAGE_SIZE_IN_MB.megabyte
      errors.add(:image_file, "must be under #{MAX_IMAGE_SIZE_IN_MB} megabytes.")
    end

    acceptable_types = [ "image/jpeg", "image/png" ]
    unless acceptable_types.include?(image_file.content_type)
      errors.add(:image_file, "must be a JPEG or PNG")
    end
  end
end
