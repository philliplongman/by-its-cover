# frozen_string_literal: true

FactoryGirl.define do

  factory :collection do
    user
    sequence(:title) { |n| "Collection #{n}" }
  end

end
