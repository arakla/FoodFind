require "test_helper"

class UserEventTest < ActiveSupport::TestCase
  def user_event
    @user_event ||= UserEvent.new
  end

  def test_valid
    assert user_event.valid?
  end
end
