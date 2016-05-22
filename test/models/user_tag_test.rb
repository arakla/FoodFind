require "test_helper"

class UserTagTest < ActiveSupport::TestCase
  # test relationships
  should belong_to(:tag)
  should belong_to(:user)

  # test validations
  should validate_presence_of(:tag)
  should validate_presence_of(:user)
  should validate_numericality_of(:tag)
  should validate_numericality_of(:user)
  should_not allow_value(-1).for(:tag)
  should_not allow_value(7.7).for(:tag)
  should_not allow_value(0).for(:tag)
  should_not allow_value(-1).for(:user)
  should_not allow_value(0).for(:user)
  should_not allow_value(7.7).for(:user)
  
  def user_tag
    @user_tag ||= UserTag.new
  end

  def test_valid
    assert user_tag.valid?
  end
end
