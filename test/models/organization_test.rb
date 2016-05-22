require "test_helper"

class OrganizationTest < ActiveSupport::TestCase
  # test relationships
  should have_many(:user_organizations)
  should have_many(:users).through(:user_organizations)
  should have_many(:event_organizations)
  should have_many(:events).through(:event_organizations)

  # test validations
  should validate_presence_of(:name)

  should_not allow_value(0).for(:is_premium)
  should_not allow_value(120).for(:is_premium)
  should_not allow_value("bad").for(:is_premium)
  should_not allow_value(-20).for(:is_premium)
  should_not allow_value(3.14159).for(:is_premium)
  should_not allow_value("1:00").for(:is_premium)  

  def organization
    @organization ||= Organization.new
  end

  def test_valid
    assert organization.valid?
  end
end
