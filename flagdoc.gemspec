lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flagdoc/version'

Gem::Specification.new do |spec|
  spec.name          = 'flagdoc'
  spec.version       = Flagdoc::VERSION
  spec.authors       = ['Nicolas LE CHENIC']
  spec.email         = ['pro.nicolaslechenic@gmail.com']

  spec.summary       = 'Flagdoc is an alternative to the rake notes and inspired by the Yardoc syntax'
  spec.homepage      = 'https://github.com/nicolaslechenic/flagdoc'
  spec.files         =
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }

  spec.license       = 'MIT'
  spec.executables   = ['flagdoc']
  spec.require_paths = ['lib']
  spec.metadata = {
    'bug_tracker_uri'   => "https://github.com/nicolaslechenic/flagdoc/issues",
    'changelog_uri'     => "https://github.com/nicolaslechenic/flagdoc/CHANGELOG.md",
    'documentation_uri' => 'https://github.com/nicolaslechenic/flagdoc',
    'source_code_uri'   => 'https://github.com/nicolaslechenic/flagdoc'
  }

  spec.add_development_dependency 'bundler',    '~> 1.16'
  spec.add_development_dependency 'pry',        '~> 0.11'
  spec.add_development_dependency 'rake',       '~> 10.0'
  spec.add_development_dependency 'rspec',      '~> 3.0'
  spec.add_development_dependency 'simplecov',  '~> 0.16'
end
