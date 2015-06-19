# Task System

module Nova
    class Task
        Tasks = {}

        def self.require_all
            Nova.require_folder :tasks
        end

        def self.[](key)
            Tasks[key.to_sym] || []
        end

        def self.[]=(key, value)
            Tasks[key.to_sym] ||= []
            Tasks[key.to_sym] << value
        end

        def self.invoke(name, params = {})
            total = self[name].count
            self[name].each_with_index do |task, idx|
                puts "===> #{idx + 1}/#{total} #{task}"
                task.new.invoke(params)
            end
        end

        # For Register

        def self.task(*names)
            names.flatten.each do |name|
                Nova::Task[name] = self
            end
        end

        # For subclassing

        def invoke(params = {})
        end

    end
end
