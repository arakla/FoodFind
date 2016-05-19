require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_many(:user_events)
  should have_many(:events).through(:user_events)
end
