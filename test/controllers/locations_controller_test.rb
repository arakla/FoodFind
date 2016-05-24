require "test_helper"

class LocationsControllerTest < ActionController::TestCase
  def location
    @location ||= locations :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:locations)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Location.count") do
      post :create, location: { active: location.active, latitude: location.latitude, longitude: location.longitude, name: location.name }
    end

    assert_redirected_to location_path(assigns(:location))
  end

  def test_show
    get :show, id: location
    assert_response :success
  end

  def test_edit
    get :edit, id: location
    assert_response :success
  end

  def test_update
    put :update, id: location, location: { active: location.active, latitude: location.latitude, longitude: location.longitude, name: location.name }
    assert_redirected_to location_path(assigns(:location))
  end

  def test_destroy
    assert_difference("Location.count", -1) do
      delete :destroy, id: location
    end

    assert_redirected_to locations_path
  end
end
