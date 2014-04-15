module ApplicationHelper
  include FoundationRailsHelper::FlashHelper

  def time_in_minutes(seconds)
    "#{seconds / 60} minutes"
  end

end
