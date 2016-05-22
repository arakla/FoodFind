require "test_helper"

class LocationTest < ActiveSupport::TestCase
  def location
    @location ||= Location.new
  end

  def test_valid
    assert location.valid?
  end
end
