require 'autotab-rails/version'

module AutoTab
  module Rails
  end
end

case ::Rails.version.to_s
when /^4/
  require 'autotab-rails/engine'
when /^3\.[12]/
  require 'autotab-rails/engine3'
when /^3\.[0]/
  require 'autotab-rails/railtie'
end
