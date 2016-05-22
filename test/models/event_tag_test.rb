require "test_helper"

class EventTagTest < ActiveSupport::TestCase
  def event_tag
    @event_tag ||= EventTag.new
  end

  def test_valid
    assert event_tag.valid?
  end
end
