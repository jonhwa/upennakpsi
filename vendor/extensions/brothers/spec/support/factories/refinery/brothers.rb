
FactoryGirl.define do
  factory :brother, :class => Refinery::Brothers::Brother do
    sequence(:first_name) { |n| "refinery#{n}" }
  end
end

