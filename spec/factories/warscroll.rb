FactoryGirl.define do
  factory :warscroll do
    name 'Liberators'

    initialize_with { new(attributes) }
    skip_create
  end
end
