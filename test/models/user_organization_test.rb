require "test_helper"

class UserOrganizationTest < ActiveSupport::TestCase
  def user_organization
    @user_organization ||= UserOrganization.new
  end

  def test_valid
    assert user_organization.valid?
  end
end
