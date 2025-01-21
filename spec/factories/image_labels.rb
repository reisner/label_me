FactoryBot.define do
  factory :image_label do
    label_name { "MyString" }
    left { 1 }
    top { 1 }
    width { 1 }
    height { 1 }
    image { nil }
  end
end
