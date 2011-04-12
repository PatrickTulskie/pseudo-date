# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{pseudo_date}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Patrick Tulskie"]
  s.date = %q{2010-01-08}
  s.description = %q{Date parser and container for partial or incomplete dates.}
  s.email = %q{PatrickTulskie@gmail.com}
  s.extra_rdoc_files = ["README.mdown", "lib/core_extensions/object.rb", "lib/core_extensions/string.rb", "lib/pseudo_date.rb", "lib/pseudo_date/parser.rb", "lib/pseudo_date/pseudo_date.rb"]
  s.files = ["Manifest", "README.mdown", "Rakefile", "lib/core_extensions/object.rb", "lib/core_extensions/string.rb", "lib/pseudo_date.rb", "lib/pseudo_date/parser.rb", "lib/pseudo_date/pseudo_date.rb", "test/test_helper.rb", "test/test_parser.rb", "pseudo_date.gemspec"]
  s.homepage = %q{http://github.com/PatrickTulskie/pseudo-date}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Pseudo_date", "--main", "README.mdown"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{pseudo_date}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Date parser and container for partial or incomplete dates.}
  s.test_files = ["test/test_helper.rb", "test/test_parser.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
