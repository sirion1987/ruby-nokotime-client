lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "nokotime/version"

Gem::Specification.new do |spec|
  spec.name          = "nokotime-ruby-client"
  spec.version       = Nokotime::VERSION
  spec.authors       = ["Domenico Giuseppe Garofoli"]
  spec.email         = ["sirion1987@gmail.com"]

  spec.summary       = "Ruby client for Noko API."
  spec.description   = "Ruby client for Noko API. #ruby #client #nokotime"
  spec.homepage      = "https://github.com/sirion1987/nokotime-ruby-client"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.4.0"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-performance"
  spec.add_development_dependency "rubocop-rspec"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "simplecov-console"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"

  spec.add_runtime_dependency "dotenv"
  spec.add_runtime_dependency "dry-validation"
  spec.add_runtime_dependency "faraday", ">= 0.15.2"
  spec.add_runtime_dependency "faraday_middleware", ">= 0.12"
  spec.add_runtime_dependency "typhoeus"
end
