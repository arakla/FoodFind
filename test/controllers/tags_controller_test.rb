require "test_helper"

class TagsControllerTest < ActionController::TestCase
  def tag
    @tag ||= tags :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:tags)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Tag.count") do
      post :create, tag: { count: tag.count, name: tag.name }
    end

    assert_redirected_to tag_path(assigns(:tag))
  end

  def test_show
    get :show, id: tag
    assert_response :success
  end

  def test_edit
    get :edit, id: tag
    assert_response :success
  end

  def test_update
    put :update, id: tag, tag: { count: tag.count, name: tag.name }
    assert_redirected_to tag_path(assigns(:tag))
  end

  def test_destroy
    assert_difference("Tag.count", -1) do
      delete :destroy, id: tag
    end

    assert_redirected_to tags_path
  end
end
