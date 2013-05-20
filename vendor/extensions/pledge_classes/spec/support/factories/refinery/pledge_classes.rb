
FactoryGirl.define do
  factory :pledge_class, :class => Refinery::PledgeClasses::PledgeClass do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

