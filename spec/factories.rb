FactoryGirl.define do
  factory :trip do
    start_point_address {"460 Fell St., San Francisco, CA"}
  end
  factory :submitted_trip, class: Trip do
    start_point_address {"460 Fell St., San Francisco, CA"}
    end_point_address {"633 Folsom St., San Francisco, CA"}
  end

  factory :valid_trip, class: Trip do
    url { Faker::Internet.domain_name }
    start_point_address {"460 Fell St., San Francisco, CA"}
    end_point_address {"633 Folsom St., San Francisco, CA"}
    start_point_latitude { 37.7 }
    start_point_longitude { -122 }
    end_point_latitude { 37.9 }
    end_point_longitude {-122.4 }
  end

  factory :trip_with_invalid_addresses, class: Trip do
    start_point_address {"bad address"}
    end_point_address {"bad address"}
  end
end
