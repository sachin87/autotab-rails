#!/usr/bin/env rake
# @author Sachin Singh

require 'bundler/gem_tasks'
require File.expand_path('../lib/autotab-rails/source_file', __FILE__)

desc "Update with Matthew's AutoTab Library"
task 'update-autotab', 'repository_url', 'branch' do |task, args|
  remote = args['repository_url'] || 'https://github.com/Mathachew/jquery-autotab'
  branch = args['branch'] || 'master'
  files = SourceFile.new
  files.fetch remote, branch
  files.cleanup
end
