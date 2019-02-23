# -*- encoding: utf-8 -*-
# stub: feedbag 0.10 ruby lib

Gem::Specification.new do |s|
  s.name = "feedbag".freeze
  s.version = "0.10"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["David Moreno".freeze]
  s.date = "2019-01-13"
  s.description = "Ruby's favorite feed auto-discovery tool".freeze
  s.email = "damog@damog.net".freeze
  s.executables = ["feedbag".freeze]
  s.extra_rdoc_files = ["README.markdown".freeze, "COPYING".freeze]
  s.files = ["COPYING".freeze, "README.markdown".freeze, "bin/feedbag".freeze]
  s.homepage = "http://github.com/damog/feedbag".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--main".freeze, "README.markdown".freeze]
  s.rubygems_version = "3.0.2".freeze
  s.summary = "RSS/Atom feed auto-discovery tool".freeze

  s.installed_by_version = "3.0.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>.freeze, ["~> 1.8", ">= 1.8.2"])
      s.add_runtime_dependency(%q<open_uri_redirections>.freeze, ["~> 0.2"])
      s.add_development_dependency(%q<shoulda>.freeze, ["~> 3"])
      s.add_development_dependency(%q<mocha>.freeze, ["~> 0.12", ">= 0.12.0"])
      s.add_development_dependency(%q<webmock>.freeze, ["~> 3"])
    else
      s.add_dependency(%q<nokogiri>.freeze, ["~> 1.8", ">= 1.8.2"])
      s.add_dependency(%q<open_uri_redirections>.freeze, ["~> 0.2"])
      s.add_dependency(%q<shoulda>.freeze, ["~> 3"])
      s.add_dependency(%q<mocha>.freeze, ["~> 0.12", ">= 0.12.0"])
      s.add_dependency(%q<webmock>.freeze, ["~> 3"])
    end
  else
    s.add_dependency(%q<nokogiri>.freeze, ["~> 1.8", ">= 1.8.2"])
    s.add_dependency(%q<open_uri_redirections>.freeze, ["~> 0.2"])
    s.add_dependency(%q<shoulda>.freeze, ["~> 3"])
    s.add_dependency(%q<mocha>.freeze, ["~> 0.12", ">= 0.12.0"])
    s.add_dependency(%q<webmock>.freeze, ["~> 3"])
  end
end
