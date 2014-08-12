# @author Sachin Singh

require 'thor'
require 'json'

class SourceFile < Thor
  include Thor::Actions

  desc 'fetch source files', 'fetch source files from GitHub'
  def fetch(remote, branch)
    self.destination_root = 'vendor/assets'
    get "#{remote}/raw/#{branch}/js/jquery.autotab.js", 'javascripts/autotab-jquery.js'
    get "#{remote}/raw/#{branch}/js/jquery.autotab.min.js", 'javascripts/autotab-jquery.min.js'
    get "#{remote}/raw/#{branch}/bower.json", 'bower.json'
    bump_version
  end

  desc 'clean up useless files', 'clean up useless files'
  def cleanup
    self.destination_root = 'vendor/assets'
    remove_file 'bower.json'
  end

  protected

  def bump_version
    inside destination_root do
      component_json = JSON.load(File.open('bower.json'))
      version = component_json['version']
      gsub_file '../../lib/autotab-rails/version.rb', /AUTO_TAB_VERSION\s=\s'(\d|\.)+'$/ do |match|
        %Q{AUTO_TAB_VERSION = '#{version}'}
      end
    end
  end
end
