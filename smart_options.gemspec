
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "smart_options/version"

Gem::Specification.new do |spec|
  spec.name          = "smart_options"
  spec.version       = SmartOptions::VERSION
  spec.authors       = ["Yuri Kasperovich"]
  spec.email         = ["ykas.gg@gmail.com"]

  spec.summary       = %q{Define custom options classes}
  spec.description   = %q{SmartOptions allows to define options classes which have default and required options}
  spec.homepage      = "https://github.com/yukas/smart_options"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3"
end
