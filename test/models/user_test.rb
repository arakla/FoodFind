require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test relationships
  should have_many(:user_events)
  should have_many(:events).through(:user_events)
  should have_many(:user_organizations)
  should have_many(:organizations).through(:user_organizations)
  should have_many(:user_tags)
  should have_many(:tags).through(:user_tags)

  # test simple validations
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:email)
  should validate_presence_of(:loyalty_status)

  # test cases taken from 67-272 Bread Express project Spring 2015
  should allow_value("fred@fred.com").for(:email)
  should allow_value("fred@andrew.cmu.edu").for(:email)
  should allow_value("my_fred@fred.org").for(:email)
  should allow_value("fred123@fred.gov").for(:email)
  should allow_value("my.fred@fred.net").for(:email)
  
  should_not allow_value("fred").for(:email)
  should_not allow_value("fred@fred,com").for(:email)
  should_not allow_value("fred@fred.uk").for(:email)
  should_not allow_value("my fred@fred.com").for(:email)
  should_not allow_value("fred@fred.con").for(:email)

  should allow_value(10.years.ago.to_date).for(:date_of_birth)
  should allow_value(1.day.ago.to_date).for(:date_of_birth)

  should_not allow_value(1.day.from_now.to_date).for(:date_of_birth)
  should_not allow_value(10.years.from_now.to_date).for(:date_of_birth)
  should_not allow_value("badValue").for(:date_of_birth)
  should_not allow_value(5).for(:date_of_birth)
  should_not allow_value("july 5th 1994").for(:date_of_birth)
  should_not allow_value(7.51994).for(:date_of_birth)

  should allow_value("Connoiseur").for(:loyalty_status)
  should allow_value("Master").for(:loyalty_status)

  should_not allow_value(5).for(:loyalty_status)
  should_not allow_value(4.5).for(:loyalty_status)
  
  def user
    @user ||= User.new
  end

  def test_valid
    assert user.valid?
  end
end
