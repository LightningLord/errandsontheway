module ApplicationHelper

  def time_in_minutes(seconds)
    "#{seconds / 60} minutes"
  end

  def reached_max_errands?
    @errands.length == 3
  end

end
