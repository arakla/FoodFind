require "test_helper"

class LocationTest < ActiveSupport::TestCase
  # test relationships
  should have_many(:events)

  # test validations
  should validate_presence_of(:name)
  should validate_presence_of(:latitude)
  should validate_presence_of(:longitude)
  should validate_presence_of(:active)

  should_not allow_value(Date.today).for(:latitude)
  should_not allow_value(1.day.ago.to_date).for(:latitude)
  should_not allow_value(1.day.from_now.to_date).for(:latitude)
  should_not allow_value("bad").for(:latitude)
  should allow_value(2).for(:latitude)
  should allow_value(3.14159).for(:latitude)
  should allow_value(0).for(:latitude)
  should allow_value(-3.14159).for(:latitude)

  should_not allow_value(Date.today).for(:longitude)
  should_not allow_value(1.day.ago.to_date).for(:longitude)
  should_not allow_value(1.day.from_now.to_date).for(:longitude)
  should_not allow_value("bad").for(:longitude)
  should allow_value(2).for(:longitude)
  should allow_value(3.14159).for(:longitude)
  should allow_value(0).for(:longitude)
  should allow_value(-3.14159).for(:longitude)

  should allow_value(FALSE).for(:active)
  should allow_value(TRUE).for(:active)
  should_not allow_value(0).for(:active)
  should_not allow_value(120).for(:active)
  should_not allow_value("bad").for(:active)
  should_not allow_value(-20).for(:active)
  should_not allow_value(3.14159).for(:active)
  should_not allow_value("1:00").for(:active) 

  def location
    @location ||= Location.new
  end

  def test_valid
    assert location.valid?
  end
end
