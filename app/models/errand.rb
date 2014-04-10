class Errand < ActiveRecord::Base
  belongs_to :route
  validates :business_name, :latitude, :longitude, :additional_duration, presence: true


end