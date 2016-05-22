require "test_helper"

class UserEventTest < ActiveSupport::TestCase
  # test relationships
  should belong_to(:event)
  should belong_to(:user)

  # test validations
  should validate_presence_of(:event)
  should validate_presence_of(:user)
  should validate_numericality_of(:event)
  should validate_numericality_of(:user)
  should_not allow_value(-1).for(:event)
  should_not allow_value(7.7).for(:event)
  should_not allow_value(0).for(:event)
  should_not allow_value(-1).for(:user)
  should_not allow_value(0).for(:user)
  should_not allow_value(7.7).for(:user)
  
  def user_event
    @user_event ||= UserEvent.new
  end

  def test_valid
    assert user_event.valid?
  end
end
