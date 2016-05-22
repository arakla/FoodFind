require "test_helper"

class EventOrganizationTest < ActiveSupport::TestCase
  def event_organization
    @event_organization ||= EventOrganization.new
  end

  def test_valid
    assert event_organization.valid?
  end
end
