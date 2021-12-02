# frozen_string_literal: true

require 'administrate/base_dashboard'

class PostDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    comments: Field::HasMany,
    votes_for: Field::HasMany,
    id: Field::Number,
    author: Field::String,
    tag: Field::String,
    body: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    cached_votes_total: Field::Number,
    cached_votes_score: Field::Number,
    cached_votes_up: Field::Number,
    cached_votes_down: Field::Number,
    cached_weighted_score: Field::Number,
    cached_weighted_total: Field::Number,
    cached_weighted_average: Field::Number.with_options(decimals: 2)
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    user
    comments

    id
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    user
    id
    author
    created_at
    updated_at
    cached_votes_up
    cached_votes_down
    cached_weighted_average
    tag
    body
    comments
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    user
    comments

    author
    tag
    body
    cached_votes_total
    cached_votes_score
    cached_votes_up
    cached_votes_down
    cached_weighted_score
    cached_weighted_total
    cached_weighted_average
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how posts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(post)
  #   "Post ##{post.id}"
  # end
end
