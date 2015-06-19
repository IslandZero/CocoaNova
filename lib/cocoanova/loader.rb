module Nova
    class Loader
        # Regular file loaders
        Registry = {}
        # Phony loaders
        Phony    = {}

        # Load all from default folder
        def self.require_all
            Nova.require_folder :loaders
        end

        # Supported extensions
        def self.supported_extensions
            Registry.keys
        end

        # Get implement
        def self.[](ext)
            Registry[ext.to_sym]
        end

        # For subclass calling

        # Register Engines
        def self.extension(*exts)
            exts.flatten.each do |ext|
                Registry[ext.to_sym] = self
                puts "Loader Loaded: '#{self}' registered to extension '#{ext}'"
            end
        end

        # Phony loader
        def self.phony(*keys)
            keys.flatten.each do |key|
                Phony[key.to_sym] = self
                puts "Phony Loader: '#{self}' registered to key '#{key}'"
            end
        end

        # For subclassing

        # Load data from a file or phony
        def load(content)
            raise "#{self}.load not implemented"
        end

    end
end
