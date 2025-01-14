FactoryBot.define do
  factory :image do
    name { "Test" }
    image_file { File.open("test/fixtures/files/test.png") }
  end
end
