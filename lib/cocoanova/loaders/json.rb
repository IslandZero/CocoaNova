require 'json'

class Nova::Loader::JSON < Nova::Loader
    extension :json

    def load(content)
        ::JSON.parse content
    end
end
