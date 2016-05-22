require "test_helper"

class UserOrganizationTest < ActiveSupport::TestCase
  # test relationships
  should belong_to(:organization)
  should belong_to(:user)

  # test validations
  should validate_presence_of(:organization)
  should validate_presence_of(:user)
  should validate_numericality_of(:organization)
  should validate_numericality_of(:user)
  should_not allow_value(-1).for(:organization)
  should_not allow_value(7.7).for(:organization)
  should_not allow_value(0).for(:organization)
  should_not allow_value(-1).for(:user)
  should_not allow_value(0).for(:user)
  should_not allow_value(7.7).for(:user)
  
  def user_organization
    @user_organization ||= UserOrganization.new
  end

  def test_valid
    assert user_organization.valid?
  end
end
