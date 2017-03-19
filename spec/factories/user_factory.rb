FactoryGirl.define do

  sequence(:username) { |n| "BookLover#{n}" }

  factory :user do
    sequence(:email) { |n| "user#{n}@email.com" }
    password "password"

    profile { Profile.new username: generate(:username) }
  end

end
