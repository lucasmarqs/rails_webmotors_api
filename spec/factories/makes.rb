FactoryGirl.define do
  factory :make do
    sequence(:name) { |n| "Make #{n}" }
    sequence(:webmotors_id)
  end
end
