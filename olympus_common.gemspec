# frozen_string_literal: true

require_relative "lib/olympus_common/version"

Gem::Specification.new do |spec|
  spec.name          = "olympus_common"
  spec.version       = OlympusCommon::VERSION
  spec.authors       = ["Larissa Machado"]
  spec.email         = ["larissa.s.machado@ericssoninovacao.com.br"]

  spec.summary       = "Olympus Common Gem"
  spec.description   = "Common operations used on Olympus"
  spec.homepage      = ""
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  # spec.metadata["allowed_push_host"] = ""

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = ""
  # spec.metadata["changelog_uri"] = ""

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "yaml_extend", "~> 1.0"
  spec.add_dependency "logging", '~> 2.2', '>= 2.2.2'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
