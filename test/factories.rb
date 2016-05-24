FactoryGirl.define do
  factory :event do
    association :location
    name "Carnival Barbeque"
    image_path "/images/example.jpg"
    description "Come enjoy some bbq during carnival!"
    age_restriction 0
    start_datetime "2016-05-25 16:17:49"
    end_datetime "2016-05-25 18:17:49"
  end

  factory :location do
    name "Carnegie Mellon University"
    longitude "-79.94199200000003"
    latitude "40.4438782"
end