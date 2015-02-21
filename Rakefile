require 'bundler/gem_tasks'
require 'rake/testtask'
require 'appraisal'

Rake::TestTask.new(:spec) do |s|
  s.libs << 'spec'
  s.pattern = 'spec/**/*_spec.rb'
end

desc 'Default: run unit specs.'
if !ENV["APPRAISAL_INITIALIZED"] && !ENV["TRAVIS"]
  task default: :appraisal
else
  task default: :spec
end

