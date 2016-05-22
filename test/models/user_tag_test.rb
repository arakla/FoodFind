require "test_helper"

class UserTagTest < ActiveSupport::TestCase
  def user_tag
    @user_tag ||= UserTag.new
  end

  def test_valid
    assert user_tag.valid?
  end
end
