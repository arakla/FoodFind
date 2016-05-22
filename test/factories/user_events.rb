FactoryGirl.define do
  factory :user_event do
    rating 1
    comments "MyText"
    check_in_time "MyString"
    datetime "MyString"
    user nil
    event nil
  end
end
