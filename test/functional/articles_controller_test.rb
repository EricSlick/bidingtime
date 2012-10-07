require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  setup do
    @blog = blogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blog" do
    assert_difference('Article.count') do
      post :create, blog: { body: @blog.body, image_url: @blog.image_url, title: @blog.title }
    end

    assert_redirected_to blog_path(assigns(:blog))
  end

  test "should show blog" do
    get :show, id: @blog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @blog
    assert_response :success
  end

  test "should update blog" do
    put :update, id: @blog, blog: { body: @blog.body, image_url: @blog.image_url, title: @blog.title }
    assert_redirected_to blog_path(assigns(:blog))
  end

  test "should destroy blog" do
    assert_difference('Article.count', -1) do
      delete :destroy, id: @blog
    end

    assert_redirected_to blogs_path
  end
end