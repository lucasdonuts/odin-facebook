FactoryBot.define do
  factory :friendship do
    user
    friend
  end


  factory :friend_request do
    recipient
    requester
  end

  factory :user, aliases: [:recipient, :requester, :friend] do
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
  factory :like do
    for_post

    trait :for_post do
      association :likeable, factory: :post
      user
    end

    trait :for_comment do
      association :likeable, factory: :comment
      user
    end
  end

  factory :comment do
    body { Faker::Hipster.sentence }
    user
    post
  end

end