class Trip < ActiveRecord::Base
  has_many :errands
  # geocoded_by :start_point_address, latitude: :start_point_latitude, longitude: :start_point_longitude
  # geocoded_by :end_point_address, latitude: :end_point_latitude, longitude: :end_point_longitude
  # after_validation :geocode, if: ->(obj){ obj.start_point_address.present? and obj.end_point_address_changed? }

end
