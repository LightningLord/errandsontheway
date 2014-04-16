module ApplicationHelper
  include FoundationRailsHelper::FlashHelper

  def time_in_minutes(seconds)
    pluralize((seconds / 60), 'minute')
  end

end
