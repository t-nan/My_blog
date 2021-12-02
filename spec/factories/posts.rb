# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    association :user
    author { 'John' }
    tag { "#{author}'s tag" }
    body { 'some text' }
  end

  factory :invalid_post, class: Post do
    association :user
    author {nil}
    tag {nil}
    body {nil}
  end

  factory :updated_post, class: Post do
    association :user
    author {'Mike'}
    tag {'updated post'}
    body {'updated post'}
  end
end
