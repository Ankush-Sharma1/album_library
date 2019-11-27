require 'test_helper'

class AlbumsControllerTest < ActionDispatch::IntegrationTest
   include Devise::Test::IntegrationHelpers
  # test "the truth" do
  #   assert true
  # end
  setup do
      get 'users/sign_in'
      sign_in users(:one)
      post user_session_url
    end




    test "should get index" do
      # get :'/albums/index'
      get albums_url
      assert_response :success
      # assert_not_nil assigns(:albums)
    end
end
