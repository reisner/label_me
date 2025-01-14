require 'rails_helper'

RSpec.describe Image, type: :model do
  it "is valid with valid attributes" do
    expect(Image.new({ name: "test",
                       image_file: File.open("test/fixtures/files/test.png") })
    ).to be_valid
  end

  it "can not have a blank name" do
    image = create(:image)
    image.name = ""
    expect {
      image.save!
    }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
