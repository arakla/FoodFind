require "test_helper"

class OrganizationTest < ActiveSupport::TestCase
  # test relationships
  should have_many(:user_organizations)
  should have_many(:users).through(:user_organizations)
  should have_many(:event_organizations)
  should have_many(:events).through(:event_organizations)

  # test validations
  should validate_presence_of(:name)
  should validate_presence_of(:is_premium)
  should validate_presence_of(:active)

  should allow_value(FALSE).for(:is_premium)
  should allow_value(TRUE).for(:is_premium)
  should_not allow_value(0).for(:is_premium)
  should_not allow_value(120).for(:is_premium)
  should_not allow_value("bad").for(:is_premium)
  should_not allow_value(-20).for(:is_premium)
  should_not allow_value(3.14159).for(:is_premium)
  should_not allow_value("1:00").for(:is_premium)

  should allow_value(FALSE).for(:active)
  should allow_value(TRUE).for(:active)
  should_not allow_value(0).for(:active)
  should_not allow_value(120).for(:active)
  should_not allow_value("bad").for(:active)
  should_not allow_value(-20).for(:active)
  should_not allow_value(3.14159).for(:active)
  should_not allow_value("1:00").for(:active) 

  def organization
    @organization ||= Organization.new
  end

  def test_valid
    assert organization.valid?
  end
end
