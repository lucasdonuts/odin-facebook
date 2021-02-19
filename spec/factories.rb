FactoryBot.define do
  factory :user do
    first_name { Faker::Name.unique.first_name }
    last_name  { Faker::Name.unique.last_name }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :post do
    body { Faker::TvShows::Community.quotes }
    user
  end

  # Like Possibility 1
  # factory :like do
  #   for_post

  #   trait :for_post do
  #     association :likeable, factory: :post
  #   end

  #   trait :for_comment do
  #     association :likeable, factory: :comment
  #   end
  # end

end