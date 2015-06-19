module Nova
    class Engine
        Registry = {}

        # Load all engines
        def self.require_all
            Nova.require_folder :engines
        end

        # Supported extensions, all symbol
        def self.supported_extensions
            Registry.keys
        end

        # Get subclass
        def self.[](ext)
            Registry[ext.to_sym]
        end

        # For subclass
        
        # Register a subclass for file extension
        def self.extension(*exts)
            exts.flatten.each do |ext|
                Registry[ext.to_sym] = self
                puts "Engine Loaded: '#{self}' registered to extension '#{ext}'"
            end
        end

        # Execute render
        def render(template, data, filename)
            raise "#{self}#render not implemented."
        end
    end
end
