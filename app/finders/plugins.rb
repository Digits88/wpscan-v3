require_relative 'plugins/urls_in_homepage'
require_relative 'plugins/known_locations'
# From the DynamicFinder
require_relative 'plugins/comment'
require_relative 'plugins/xpath'
require_relative 'plugins/header_pattern'

module WPScan
  module Finders
    module Plugins
      # Plugins Finder
      class Base
        include CMSScanner::Finders::SameTypeFinder

        # @param [ WPScan::Target ] target
        def initialize(target)
          finders <<
            Plugins::UrlsInHomepage.new(target) <<
            Plugins::HeaderPattern.new(target) <<
            Plugins::Comment.new(target) <<
            Plugins::Xpath.new(target) <<
            Plugins::KnownLocations.new(target)
        end
      end
    end
  end
end
