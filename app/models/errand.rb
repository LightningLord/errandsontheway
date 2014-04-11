class Errand < ActiveRecord::Base
  belongs_to :trip
  validates :business_name, :latitude, :longitude, :additional_duration, presence: true


end