$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ng_template/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ng_template"
  s.version     = NgTemplate::VERSION
  s.authors     = ["Kari Ikonen"]
  s.email       = ["mr.kari.ikonen@gmail.com"]
  s.homepage    = "https://github.com/kikonen/ng_template"
  s.summary     = "AngularJS template handler for Rails"
  s.description = "Manage AngularJS templates as HTML partials"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", ">= 4.1.0", "< 5.0"

  s.add_development_dependency "sqlite3"
end
