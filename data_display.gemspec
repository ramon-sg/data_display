# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'data_display/version'

Gem::Specification.new do |spec|
  spec.name          = 'data_display'
  spec.version       = DataDisplay::VERSION
  spec.authors       = ['ramón soto']
  spec.email         = ['ramon.soto@clouw.com']
  spec.summary       = %q{show attributes better}
  spec.homepage      = ""
  spec.license       = "MIT"
  spec.description   = %q{show attributes better}

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency     'rails', '~> 5.0'

  spec.add_development_dependency 'appraisal'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'mocha', '>= 1.1.0'
  spec.add_development_dependency 'factory_girl', '~> 4.0'
  spec.add_development_dependency 'minitest', '>= 4.0'

  spec.required_ruby_version = '>= 1.9'
end
