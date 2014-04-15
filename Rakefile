#!/usr/bin/env rake
require 'bundler/gem_tasks'
require File.expand_path('../lib/autotab-rails/source_file', __FILE__)

desc "Update with Harvest's AutoTab Library"
task 'update-autotab', 'repository_url', 'branch' do |task, args|
  remote = args['repository_url'] || 'https://github.com/sachin87/autotab-rails'
  branch = args['branch'] || 'master'
  files = SourceFile.new
  files.fetch remote, branch
  files.eject_javascript_class_from_closure
  files.cleanup
end
