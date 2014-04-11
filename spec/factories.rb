FactoryGirl.define do
  # factory :trip do
  #   url { Faker::Internet.domain_name }
  #   ending_duration { 0 }
  #   original_duration { rand(30) }
  #   start_point_latitude { 37.7 }
  #   start_point_longitude { -122 }
  #   end_point_latitude { 37.9 }
  #   end_point_longitude {-122.4 }
  # end

  factory :trip do
    start_point_address {"460 Fell St., San Francisco, CA"} 
    end_point_address {"633 Folsom St., San Francisco, CA"}
  end
end
