class Nova::Task::Compile < Nova::Task
    task :compile

    def load_data
        # Load regular data
        Dir["#{Nova.local_root}/data/*"].each do |file|
            key     = File.basename(file).split('.').first.downcase.to_sym
            extname = file.split('.').last.to_sym
            if Nova::Loader.supported_extensions.include?(extname)
                content = File.open(file).read
                Nova.data[key] = Nova::Loader[extname].new.load(content)
            else
                raise "Data file extension '#{extname}' not supported"
            end
        end
        # Load phony data
        Nova::Loader::Phony.each_pair do |key, clazz|
            Nova.data[key] = clazz.new.load(key)
        end
    end

    def invoke(params = {})
        raise "Nova.local_root not set" unless Nova.local_root
        raise "Nova.src_root not set"   unless Nova.src_root

        Nova::Helper.require_all
        Nova::Loader.require_all
        Nova::Engine.require_all

        self.load_data

        # Find all *.erb and render from yml file
        Dir["#{Nova.src_root}/**/*"].each do |file|
            extname = file.split('.').last.to_sym
            if Nova::Engine.supported_extensions.include? extname
                template= File.open(file).read
                target  = File.join File.dirname(file), File.basename(file, ".*")
                puts "File Rendering: #{target}"
                result  = Nova::Engine[extname].new.render(template, Nova.data, target)
                File.open(target, 'w') { |tf| tf.write(result) }
            end
        end

        puts "Done !"
    end
end
