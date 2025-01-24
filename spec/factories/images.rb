FactoryBot.define do
  factory :image do
    name { "Test" }
    image_file { File.open("test/fixtures/files/test.png") }

    trait :labelled do
      association(:image_label)
    end
  end
end
