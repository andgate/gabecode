require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  def setup
    @micropost = articles(:orange)
  end
  
  test "Article.new should redirect when not logged in" do
    get :new
    assert_redirected_to login_url
  end
  
  test "Article.create should redirect when not logged in" do
    assert_no_difference 'Article.count' do
      post :create, article: { title: "Foobar", text: "Lorum ipsum" }
    end
    assert_redirected_to login_url
  end
  
  test "Article.destroy should redirect destroy when not logged in" do
    assert_no_difference 'Article.count' do
      post :destroy, id: @micropost
    end
    assert_redirected_to login_url
  end
end
