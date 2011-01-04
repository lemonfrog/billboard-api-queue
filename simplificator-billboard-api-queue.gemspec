# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{simplificator-billboard-api-queue}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["simplificator"]
  s.date = %q{2011-01-04}
  s.description = %q{Billboard-API is needed to add the additional models for the billboard application.}
  s.email = %q{info@simplificator.com}
  s.files = [
    "MIT-LICENSE",
    "Rakefile",
    "VERSION",
    "generators/queue/queue_generator.rb",
    "generators/queue/templates/USAGE",
    "generators/queue/templates/migrate/create_order_queue.rb",
    "generators/queue/templates/models/billboard_api/order_queue.rb",
    "init.rb",
    "install.rb",
    "lib/billboard_api_queue.rb",
    "lib/tasks/billboard_api_queue_tasks.rake",
    "test/inplace_test.rb",
    "uninstall.rb"
  ]
  s.homepage = %q{http://github.com/simplificator/billboard-api-queue}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Billboard API queue gem}
  s.test_files = [
    "test/inplace_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>, [">= 0"])
    else
      s.add_dependency(%q<shoulda>, [">= 0"])
    end
  else
    s.add_dependency(%q<shoulda>, [">= 0"])
  end
end
