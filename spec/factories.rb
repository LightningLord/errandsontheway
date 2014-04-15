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
    travel_mode {"walking"}
    start_point_latitude { 37.7 }
    start_point_longitude { -122 }
    end_point_latitude { 37.9 }
    end_point_longitude {-122.4 }
  end

  factory :trip_with_invalid_addresses, class: Trip do
    start_point_address {"bad address"}
    end_point_address {"bad address"}
  end

  factory :valid_errand, class: Errand do
    business_name {"Melanie's Bagel Shop"}
    address {"1111 California Street, San Francisco, CA"}
    delta_duration {360}
    latitude {11.11}
    longitude {22.22}
  end
end
