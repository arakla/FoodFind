require "test_helper"

class OrganizationsControllerTest < ActionController::TestCase
  def organization
    @organization ||= organizations :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:organizations)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Organization.count") do
      post :create, organization: { active: organization.active, description: organization.description, is_premium: organization.is_premium, name: organization.name }
    end

    assert_redirected_to organization_path(assigns(:organization))
  end

  def test_show
    get :show, id: organization
    assert_response :success
  end

  def test_edit
    get :edit, id: organization
    assert_response :success
  end

  def test_update
    put :update, id: organization, organization: { active: organization.active, description: organization.description, is_premium: organization.is_premium, name: organization.name }
    assert_redirected_to organization_path(assigns(:organization))
  end

  def test_destroy
    assert_difference("Organization.count", -1) do
      delete :destroy, id: organization
    end

    assert_redirected_to organizations_path
  end
end
