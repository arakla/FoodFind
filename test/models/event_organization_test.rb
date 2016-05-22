require "test_helper"

class EventOrganizationTest < ActiveSupport::TestCase
  # test relationships
  should belong_to(:events)
  should belong_to(:organizations)

  # test validations
  should validate_presence_of(:event)
  should validate_presence_of(:organization)
  should validate_numericality_of(:event)
  should validate_numericality_of(:organization)
  should_not allow_value(-1).for(:event)
  should_not allow_value(0).for(:event)
  should_not allow_value(50.50).for(:event)
  should_not allow_value(-1).for(:organization)
  should_not allow_value(0).for(:organization)
  should_not allow_value(50.50).for(:organization)
  
  def event_organization
    @event_organization ||= EventOrganization.new
  end

  def test_valid
    assert event_organization.valid?
  end
end
