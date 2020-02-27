require_relative 'lib/vets_api_common/version'

Gem::Specification.new do |spec|
  # REVIEW these defaults
  spec.name          = "vets_api_common"
  spec.version       = VetsApiCommon::VERSION
  spec.authors       = ["Philip Becker"]
  spec.email         = ["philip.becker@oddball.io"]

  # REVIEW summary/description
  spec.summary       = %q{Common utility classes for vets-api}
  spec.description   = %q{These are classes used by the Veteran Services Platform to power interacting with VA services.}
  # spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.required_ruby_version = Gem::Requirement.new(">= 2.6.5")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'faraday', '~> 0.17.0'
  spec.add_runtime_dependency 'activemodel', '~> 5.2.4.1'
  spec.add_runtime_dependency 'actionpack', '~> 5.2.4.1'
  spec.add_runtime_dependency 'carrierwave', '~> 0.11'
  spec.add_runtime_dependency 'virtus', '~> 1.0.5'
  spec.add_runtime_dependency 'dry-types', '~> 1.2.2'
  spec.add_runtime_dependency 'dry-struct', '~> 1.2.0'
  spec.add_runtime_dependency 'mini_magick', '~> 4.10.1'
  spec.add_runtime_dependency 'redis', '~> 3.3.5'
  spec.add_runtime_dependency 'redis-namespace', '~> 1.7.0'
  spec.add_runtime_dependency 'oj', '~> 3.9.0'
  spec.add_runtime_dependency 'vcr', '~> 5.1.0'
  spec.add_runtime_dependency 'statsd-instrument', '~> 2.6.0'
  spec.add_runtime_dependency 'breakers', '~> 0.3.0'
  spec.add_runtime_dependency 'httpclient', '~> 2.8.3'
  # TODO add more dependencies

  spec.add_development_dependency 'timecop', '~> 0.9.1'
  spec.add_development_dependency 'fakeredis', '~> 0.7.0'
  spec.add_development_dependency 'factory_bot', '~> 5.1.1'
  spec.add_development_dependency 'faker', '~> 2.10.2'
  spec.add_development_dependency 'webmock', '~> 3.8.2'
  spec.add_development_dependency 'byebug'
end
