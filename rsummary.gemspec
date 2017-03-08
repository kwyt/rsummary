# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rsummary/version'

Gem::Specification.new do |spec|
  spec.name          = "rsummary"
  spec.version       = Rsummary::VERSION
  spec.authors       = ["yuta kawanago"]
  spec.email         = ["yuuta7815@gmail.com"]

  spec.summary       = %q{rsummary can provide saving Rspec summary and showing past summaries}
  spec.description   = %q{https://github.com/kwyt/rsummary}
  spec.homepage      = "https://github.com/kwyt/rsummary"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "thor", "0.19.1"
  spec.add_dependency "terminal-table"
end
