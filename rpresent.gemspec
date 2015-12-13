# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'rpresent'
  spec.version       = '0.0.1'
  spec.authors       = ['the-architect']
  spec.email         = ['marcel.scherf@epicteams.com']

  spec.summary       = %q{Presenters for your rails application}
  spec.description   = %q{Presenters for your rails application}
  spec.homepage      = 'https://github.com/the-architect/rpresent'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'ruby_gntp'
  spec.add_development_dependency 'coveralls'
end
