FactoryGirl.define do
  factory :army do
    grand_alliance_name 'Order'

    name 'Stormcast Eternals'

    initialize_with { new(attributes) }
    skip_create
  end
end
