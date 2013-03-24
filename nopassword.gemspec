$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "nopassword/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "nopassword"
  s.version     = Nopassword::VERSION
  s.authors     = ["Alex Smolen"]
  s.email       = ["me@alexsmolen.com"]
  s.homepage    = "https://github.com/alsmola/nopassword"
  s.summary     = "NoPassword is a simple authentication and session engine that doesn't use passwords."
  s.description = "NoPassword uses tokens sent to an email address, similar to most forgot password functionality. These tokens created long-lived sessions that can be tracked and revoked easily."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0.beta"
  s.add_dependency "browser"
  s.add_dependency "geoip"
  s.add_dependency "bcrypt-ruby", '~> 3.0.0'
  s.add_dependency "passw3rd"

  s.add_development_dependency "sqlite3"
end
