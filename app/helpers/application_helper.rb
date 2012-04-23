module ApplicationHelper
  def friendly_time(time)
    time.strftime("%d-%m-%Y %H:%M")
  end

  def browser_name(ua)
    Browser.new(:ua => ua).to_s.split(' ')[0].capitalize
  end
end
