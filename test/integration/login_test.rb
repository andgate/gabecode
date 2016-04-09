require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  
  include SessionsHelper

  def setup
    # Generate a test password
    @password = "abdefghij"
    # Store that password's salt/hash in the environment
    ENV['PASS_SALT'] = BCrypt::Engine.generate_salt
    ENV['PASS_HASH'] = BCrypt::Engine.hash_secret(@password, ENV['PASS_SALT']) 
  end

  test "login with valid information followed by logout" do
    get login_path
    post login_path, session: { password: @password }
    assert_redirected_to root_path
    follow_redirect!
    assert_template 'static_pages/home'
    assert_select "a[href=?]", logout_path
    
    delete logout_path
    assert_not logged_in?
    assert_redirected_to root_url
    assert_select "a[href=?]", logout_path, count: 0
    
    delete logout_path
    follow_redirect!
    assert_select "a[href=?]", logout_path, count: 0
  end

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { password: "invalid" }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end
