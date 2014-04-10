class Route < ActiveRecord::Base
  has_many :errands
  validates :start_point,
            :end_point, 
            presence: true,
            format: { 
              with: /^([-+]?\d{1,2}[.]\d+),\s*([-+]?\d{1,3}[.]\d+)$/
            }
end
