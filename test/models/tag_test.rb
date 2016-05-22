require "test_helper"

class TagTest < ActiveSupport::TestCase
  # test relationships
  should have_many(:user_tags)
  should have_many(:users).through(:user_tags)
  should have_many(:event_tags)
  should have_many(:events).through(:event_tags)

  # test validations
  should validate_presence_of(:name)
  
  def tag
    @tag ||= Tag.new
  end

  def test_valid
    assert tag.valid?
  end
end
