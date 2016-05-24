require "test_helper"

class UserEventTest < ActiveSupport::TestCase
  # test relationships
  should belong_to(:event)
  should belong_to(:user)

  # test validations
  should validate_presence_of(:event)
  should validate_presence_of(:user)
  should validate_presence_of(:check_in_time)


  should validate_numericality_of(:event)
  should validate_numericality_of(:user)
  should_not allow_value(-1).for(:event)
  should_not allow_value(7.7).for(:event)
  should_not allow_value(-1).for(:user)
  should_not allow_value(7.7).for(:user)

  should validate_numericality_of(:rating)
  should allow_value(0).for(:rating)
  should allow_value(5).for(:rating)
  should_not allow_value(6).for(:rating)
  should_not allow_value(-1).for(:rating)
  should_not allow_value(7.7).for(:rating)

  should allow_value(Date.today).for(:check_in_time)
  should allow_value(1.day.ago.to_date).for(:check_in_time)
  should allow_value(1.day.from_now.to_date).for(:check_in_time)
  should_not allow_value("bad").for(:check_in_time)
  should_not allow_value(2).for(:check_in_time)
  should_not allow_value(3.14159).for(:check_in_time)

  def user_event
    @user_event ||= UserEvent.new
  end

  def test_valid
    assert user_event.valid?
  end
end
