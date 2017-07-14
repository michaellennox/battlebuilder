FactoryGirl.define do
  factory :grand_alliance do
    trait :order do
      name 'Order'
    end

    trait :death do
      name 'Death'
    end

    trait :destruction do
      name 'Destruction'
    end

    trait :chaos do
      name 'Chaos'
    end

    initialize_with { new(attributes) }
    skip_create
  end
end
