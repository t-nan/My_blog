# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user #{n}" }
    sequence(:email) { |n| "#{n}abc@emailer.com" }
    password { '1234567' }
    password_confirmation { '1234567' }
  end
end
