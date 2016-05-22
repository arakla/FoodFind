require "test_helper"

class EventTagTest < ActiveSupport::TestCase
  # test relationships
  should belong_to(:events)
  should belong_to(:tags)

  # test validations
  should validate_presence_of(:event)
  should validate_presence_of(:tag)
  should validate_numericality_of(:event)
  should validate_numericality_of(:tag)
  should_not allow_value(-1).for(:event)
  should_not allow_value(0).for(:event)
  should_not allow_value(50.50).for(:event)
  should_not allow_value(-1).for(:tag)
  should_not allow_value(0).for(:tag)
  should_not allow_value(50.50).for(:tag)

  def event_tag
    @event_tag ||= EventTag.new
  end

  def test_valid
    assert event_tag.valid?
  end
end
