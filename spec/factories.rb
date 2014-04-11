FactoryGirl.define do
  factory :route do
    url { Faker::Internet.domain_name }
    ending_duration { 0 }
    original_duration { rand(30) }
    start_point_latitude { 37.7 }
    start_point_longitude { -122 }
    end_point_latitude { 37.9 }
    end_point_longitude {-122.4 }
  end
end
