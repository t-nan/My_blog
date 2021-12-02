# frozen_string_literal: true

class Post < ApplicationRecord
  validates :author, presence: true
  validates :body, presence: true

  belongs_to :user
  has_many :comments

  acts_as_votable
end
