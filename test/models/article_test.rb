require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def setup
    @article = Article.new(title: "Foobar", text: "Lorem ipsum")
  end

  test "article should be valid" do
    assert @article.valid?
  end
  
  test "title should be present" do
    @article.title = "   "
    assert_not @article.valid?
  end

  test "title should not be blank" do
    @article.title = ""
    assert_not @article.valid?
  end
  
  test "title should not be exeed 140 characters" do
    @article.title = "a" * 141
    assert_not @article.valid?
  end
  
  test "text should be present" do
    @article.text = "   "
    assert_not @article.valid?
  end

  test "text should not be blank" do
    @article.text = ""
    assert_not @article.valid?
  end
end
