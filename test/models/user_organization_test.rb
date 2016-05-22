require "test_helper"

class UserOrganizationTest < ActiveSupport::TestCase
  # test relationships
  should belong_to(:organization)
  should belong_to(:user)

  # test validations
  should validate_presence_of(:organization)
  should validate_presence_of(:user)
  should validate_presence_of(:org_role)

  should allow_value("Member").for(:org_role)
  should allow_value("Admin").for(:org_role)
  should_not allow_value("Grand Puba").for(:org_role)
  should_not allow_value("Bob").for(:org_role)
  should_not allow_value("Kevin").for(:org_role)
  should_not allow_value("Minion").for(:org_role)
  should_not allow_value("Sith Lord").for(:org_role)

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
