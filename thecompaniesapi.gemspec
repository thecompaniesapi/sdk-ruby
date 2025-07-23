require_relative 'lib/thecompaniesapi/version'

Gem::Specification.new do |spec|
  spec.name          = "thecompaniesapi"
  spec.version       = TheCompaniesAPI::VERSION
  spec.authors       = ["The Companies API SARL"]
  spec.email         = ["yael@thecompaniesapi.com"]

  spec.summary       = 'Ruby SDK for The Companies API'
  spec.description   = 'A fully-featured Ruby SDK for The Companies API, providing type-safe access to company data, locations, industries, technologies, job titles, lists, and more.'
  spec.homepage      = "https://github.com/thecompaniesapi/sdk-ruby"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = "https://www.thecompaniesapi.com"
  spec.metadata["source_code_uri"] = "https://github.com/thecompaniesapi/sdk-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/thecompaniesapi/sdk-ruby/releases"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` command works on MacOS to list files tracked by git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Runtime dependencies
  spec.add_runtime_dependency "faraday", "~> 2.0"
  spec.add_runtime_dependency "faraday-net_http", "~> 3.0"
  
  # Development dependencies
  spec.add_development_dependency "dotenv", "~> 2.8"
end
