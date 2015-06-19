require 'rubygems'
require 'active_support/all'

module Nova
    Plugins     = []

    @@root      = nil
    @@src_root  = nil
    @@data      = {}

    autoload :VERSION, 'cocoanova/version'
    autoload :Loader,  'cocoanova/loader'
    autoload :Engine,  'cocoanova/engine'
    autoload :Helper,  'cocoanova/helper'
    autoload :Task,    'cocoanova/task'

    # Register Plugin
    def self.register_plugin(path)
        Plugins << path
    end

    # Global data
    def self.data
        @@data
    end

    def self.data=(value)
        @@data = value
    end

    # Get preset_path, i.e. lib/cocoanova
    def self.preset_path
        File.expand_path('../cocoanova', __FILE__)
    end

    # Get project root
    def self.src_root
        @@src_root
    end

    # Set project root
    def self.src_root=(value)
        @@src_root= value
    end

    # Get local nova root
    def self.root
        @@root
    end

    # Set local nova root
    def self.root=(value)
        @@root = value
    end

    # Require a folder in both preset path and local path
    def self.require_folder(folder)
        # Require folder from preset path, i.e. lib/cocoanova/
        Dir["#{self.preset_path}/#{folder}/**/*.rb"].each do |file|
            puts "requiring", file
            require file
        end
        # Load Plugins
        Plugins.each do |path|
            Dir["#{path}/#{folder}/**/*.rb"].each do |file|
            puts "requiring", file
                require file
            end
        end
        # Require folder from local nova path, i.e. ./nova/
        if self.root
            Dir["#{self.root}/#{folder}/**/*.rb"].each do |file|
            puts "requiring", file
                require file
            end
        end
    end
end
