class Trip < ActiveRecord::Base
  has_many :errands
  geocoded_by :start_point_address, latitude: :start_point_latitude, longitude: :start_point_longitude
  geocoded_by :end_point_address, latitude: :end_point_latitude, longitude: :end_point_longitude
  after_validation :geocode #, if: :start_point_address.present? and :end_point_address.present? 

#before validation, run geocode.
#if lats and longs are nil, error
#validation for startpoint and endpoint address. (not empty) must be present

end
