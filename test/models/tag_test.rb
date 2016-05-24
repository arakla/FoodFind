require "test_helper"

class TagTest < ActiveSupport::TestCase
  # test relationships
  should have_many(:user_tags)
  should have_many(:users).through(:user_tags)
  should have_many(:event_tags)
  should have_many(:events).through(:event_tags)

  # test validations
  should validate_presence_of(:name)
  should validate_presence_of(:count)

  should validate_numericality_of(:count)
  should allow_value(0).for(:count)
  should allow_value(2).for(:count)

  should_not allow_value(-1).for(:count)
  should_not allow_value(50.50).for(:count)
  should_not allow_value(Date.today).for(:count)
  should_not allow_value(1.day.ago.to_date).for(:count)
  should_not allow_value(1.day.from_now.to_date).for(:count)
  should_not allow_value("bad").for(:count)
  should_not allow_value(3.14159).for(:count)
  should_not allow_value(-3.14159).for(:count)

  def tag
    @tag ||= Tag.new
  end

  def test_valid
    assert tag.valid?
  end
end
