Gem::Specification.new do |s|
    s.name        = 'cocoanova'
    s.version     = '1.0.0'
    s.date        = '2015-06-20'
    s.summary     = "CocoaNova is a iOS project management toolkit"
    s.description = "CocoaNova is a iOS project management toolkit, providing code generator and assets checking."
    s.authors     = ["Yanke Guo"]
    s.email       = 'me@yanke.io'
    s.executables = ["nova"]
    s.files       = Dir['lib/**/*.rb'] + Dir['bin/*']
    s.require_paths = ["lib"]
    s.homepage    =
        'http://rubygems.org/gems/cocoanova'
    s.license       = 'MIT'

    s.add_runtime_dependency 'activesupport', '~> 4.0.0'
end
