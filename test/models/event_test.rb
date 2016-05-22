require "test_helper"

class EventTest < ActiveSupport::TestCase
  # test relationships
  should have_many(:user_events)
  should have_many(:users).through(:user_events)
  should have_many(:event_organizations)
  should have_many(:organizations).through(:event_organizations)
  should have_many(:event_tags)
  should have_many(:tags).through(:event_tags)
  should belong_to(:events)

  # test validations
  should validate_presence_of(:name)
  should validate_presence_of(:location)
  should validate_presence_of(:start_time)
  should validate_presence_of(:end_time)

  should validate_presence_of(:location)
  should validate_numericality_of(:location)
  should_not allow_value(-1).for(:location)
  should_not allow_value(0).for(:location)
  should_not allow_value(50.50).for(:location)

  should allow_value(Date.today).for(:start_time)
  should allow_value(1.day.ago.to_date).for(:start_time)
  should allow_value(1.day.from_now.to_date).for(:start_time)
  should_not allow_value("bad").for(:start_time)
  should_not allow_value(2).for(:start_time)
  should_not allow_value(3.14159).for(:start_time)

  should allow_value(Date.today).for(:end_time)
  should allow_value(1.day.ago.to_date).for(:end_time)
  should allow_value(1.day.from_now.to_date).for(:end_time)
  should_not allow_value("bad").for(:end_time)
  should_not allow_value(2).for(:end_time)
  should_not allow_value(3.14159).for(:end_time)

  
  def event
    @event ||= Event.new
  end

  def test_valid
    assert event.valid?
  end
end
