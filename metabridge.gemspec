# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'meta_bridge/version'

Gem::Specification.new do |spec|
  spec.name          = "metabridge"
  spec.version       = MetaBridge::VERSION
  spec.version       = "#{spec.version}-#{ENV['BUILD_NUMBER']}" if ENV['BUILD_NUMBER']
  spec.authors       = ["Andrei Maxim"]
  spec.email         = ["max@throwpoint.ro"]

  spec.summary       = %q{Get logcat output from a remote Android tablet.}
  spec.description   = %q{Get logcat output from a remote Android tablet using adb commands.}
  spec.homepage      = "https://github.com/Telmate/metabridge"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'thor', '~> 0.19.1'

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.6"
end
