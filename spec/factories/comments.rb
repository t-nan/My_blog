# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    association :post
    association :user
    sequence(:author) { |n| "author #{n}" }
    sequence(:body) { |n| "text #{n}" }
  end
end
