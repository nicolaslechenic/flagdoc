lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flagdoc/version'

Gem::Specification.new do |spec|
  spec.name          = 'flagdoc'
  spec.version       = Flagdoc::VERSION
  spec.authors       = ['Nicolas LE CHENIC']
  spec.email         = ['pro.nicolaslechenic@gmail.com']

  spec.summary       = 'Displays the flags written in your ruby ​​code'
  spec.homepage      = 'https://github.com/nicolaslechenic/flagdoc'
  spec.files         =
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }

  spec.license       = 'MIT'
  spec.executables   = ['flagdoc']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler',    '~> 1.16'
  spec.add_development_dependency 'pry',        '~> 0.11'
  spec.add_development_dependency 'rake',       '~> 10.0'
  spec.add_development_dependency 'rspec',      '~> 3.0'
  spec.add_development_dependency 'simplecov',  '~> 0.16'
end
