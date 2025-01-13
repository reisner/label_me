require 'rails_helper'

RSpec.describe Image, type: :model do
  it "is valid with valid attributes" do
    expect(Image.new({ name: "test",
                       image_file: File.open("test/fixtures/files/test.png") })
    ).to be_valid
  end
end
