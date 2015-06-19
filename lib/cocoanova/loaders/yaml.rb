require 'yaml'

class Nova::Loader::YAML < Nova::Loader
  extension :yml, :yaml

  def load(content)
    ::YAML.load(content)
  end
end
