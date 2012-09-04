module Nopassword
  module ApplicationHelper
    def friendly_time(time)
      time_ago_in_words(time) + " ago"
    end

    def browser_name(ua)
      Browser.new(:ua => ua).to_s.split(' ')[0].capitalize
    end
  end
end
