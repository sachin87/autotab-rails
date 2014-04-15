require 'thor'
require 'json'

class SourceFile < Thor
  include Thor::Actions

  desc 'fetch source files', 'fetch source files from GitHub'
  def fetch remote, branch
    self.destination_root = 'vendor/assets'
    get "#{remote}/raw/#{branch}/js/jquery.autotab.js", 'javascripts/jquery.autotab.js'
    get "#{remote}/raw/#{branch}/js/jquery.autotab.min.js", 'javascripts/jquery.autotab.min.js'
    get "#{remote}/raw/#{branch}/component.json", 'component.json'
    bump_version
  end

  desc 'eject class from closure', 'eject javascript library class from closure'
  def eject_javascript_class_from_closure
    self.destination_root = 'vendor/assets'
    inside destination_root do
      append_to_file 'javascripts/lib/abstract-autotab.coffee' do
        "\nwindow.AbstractAutoTab = AbstractAutoTab\n"
      end
      append_to_file 'javascripts/lib/select-parser.coffee' do
        "\n\nwindow.SelectParser = SelectParser\n"
      end
    end
  end

  desc 'clean up useless files', 'clean up useless files'
  def cleanup
    self.destination_root = 'vendor/assets'
    remove_file 'package.json'
  end

  protected

  def bump_version
    inside destination_root do
      component_json = JSON.load(File.open('component.json'))
      version = component_json['version']
      gsub_file '../../lib/autotab-rails/version.rb', /AUTO_TAB_VERSION\s=\s'(\d|\.)+'$/ do |match|
        %Q{AUTO_TAB_VERSION = '#{version}'}
      end
    end
  end
end