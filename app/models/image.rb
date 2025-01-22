class Image < ApplicationRecord
  has_many :image_labels
  accepts_nested_attributes_for :image_labels

  has_one_attached :image_file do |attachable|
    attachable.variant :thumb, resize_to_limit: [ 100, 100 ], preprocessed: true
    attachable.variant :labelling, resize_to_limit: [ 1200, 800 ], preprocessed: true # Fitting to screen for labelling ([width, height])
  end

  validates_presence_of :name
  validates :image_file, presence: true

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
end
