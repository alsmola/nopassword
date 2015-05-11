require 'rubygems'
require 'bcrypt'
require 'browser'
require 'geoip'

module Nopassword
  class Engine < ::Rails::Engine
    isolate_namespace Nopassword

    initializer  "load_helpers" do
      ActionController::Base.send :include, CheckSession
      ActionView::Base.send :include, ApplicationHelper
    end
  end
end
