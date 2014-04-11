class Route < ActiveRecord::Base
  has_many :errands
  validates :start_point_longitude,
            :start_point_latitude,
            :end_point_longitude,
            :end_point_latitude,
            presence: true
end
