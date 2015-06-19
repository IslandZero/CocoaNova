require 'erb'
require 'ostruct'
require 'digest'

class Nova::Engine::ERB < Nova::Engine
    extension :erb

    def render(_template, _data, _filename)
        clazz = ::ERB.new(_template).def_class
        clazz.class_eval do
            include Nova::Helper

            def initialize(data, filename)
                @data = data
                @filename = filename
            end

            def filename
                @filename
            end

            def data
                @data
            end
        end
        clazz.new(OpenStruct.new(_data), _filename).result
    end

end
