module Nopassword
  module ApplicationHelper
    def friendly_time(time)
      time_ago_in_words(time) + " ago"
    end

    def browser_name(ua)
      b = Browser.new(:ua => "ua")
      b.name.capitalize + " (" + b.platform.name + ")"
    end
  end
end
