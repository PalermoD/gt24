require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "GT24 | New York's very own social network and media experience"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help | New York's very own social network and media experience"
  end

  test "should get about" do 
  	get :about
  	assert_response :success
  	assert_select "title", "About | New York's very own social network and media experience"
  end

  test "should get contact" do 
    get :contact
    assert_response :success
    assert_select "title", "Contact | New York's very own social network and media experience"
  end



end
