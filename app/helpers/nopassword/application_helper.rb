module Nopassword
  module ApplicationHelper
    def friendly_time(time)
      time_ago_in_words(time) + " ago"
    end
  end
end
