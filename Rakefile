require "bundler/gem_tasks"
require 'rake/testtask'
require 'rake/clean'

CLOBBER.include('**/*.gem')

Rake::TestTask.new do |t|
  t.libs << 'spec'
  t.pattern = "spec/**/*_spec.rb"
end

task :default => [:test]
