require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home | GabeCode"
  end

  test "should get resume" do
    get :resume
    assert_response :success
    assert_select "title", "Resume | GabeCode"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | GabeCode"
  end

end
