require 'rails_helper'

RSpec.describe ImageLabel, type: :model do
  it "can add label to image" do
    image = create(:image)

    expect do
      image_label = ImageLabel.new(image: image, label_name: "test", left: 1, top: 1, width: 1, height: 1)
      image_label.save
    end.to change { ImageLabel.count }.by(1)
  end

  it "can remove label from image" do
    image_label = create(:image_label)
    image = image_label.image

    expect do
      image.image_labels.destroy_all
    end.to change { ImageLabel.count }.by(-1)
  end

  it "can add labels via json" do
    image = create(:image)
    labels_json = {
      1 => {
        top: 1, left: 1, width: 1, height: 1, label_name: 'test'
      },
      2 => {
        top: 1, left: 1, width: 1, height: 1, label_name: 'test'
      }
    }

    expect do
      image.save_labels(labels_json)
    end.to change { ImageLabel.count }.by(2)

    expect(image.image_labels.size).to equal(2)
  end
end
