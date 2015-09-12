# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ontime/version'

Gem::Specification.new do |spec|
  spec.name          = 'ontime'
  spec.version       = On::VERSION
  spec.authors       = ['Nathaniel Wroblewski']
  spec.email         = %w{nathanielwroblewski@gmail.com}
  spec.summary       = %q{Create times in ruby.}
  spec.description   = %q{OnTime is a dependency-less, thread-safe, and fluent way to create times in ruby.}
  spec.homepage      = 'http://github.com/nathanielwroblewski/ontime'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 10.4'
  spec.add_development_dependency 'rspec', '~> 3.3'
end
