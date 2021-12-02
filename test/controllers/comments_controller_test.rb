# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index,new,show,edit' do
    get comments_index, new, show, edit_url
    assert_response :success
  end
end
