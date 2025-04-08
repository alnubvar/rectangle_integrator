# frozen_string_literal: true

require_relative "lib/version"

Gem::Specification.new do |spec|
  spec.name = "rectangle_integrator"
  spec.version = RectangleIntegrator::VERSION
  spec.authors = ["Gennadii Mikhailov"]
  spec.email = ["bennadiigykin@mail.ru"]

  spec.summary = "Calculation of a definite integral using numerical methods."
  spec.description = "This gem provides an opportunity to calculate a definite integral using the rectangle method, and it's also possible to use more accurate compound formulas of the rectangle method."
  spec.homepage = "https://github.com/alnubvar/rectangle_integrator"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"
'''
  spec.metadata["allowed_push_host"] = "https://example.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] =  "https://github.com/alnubvar/rectangle_integrator"
  spec.metadata["changelog_uri"] = "https://example.com"
'''
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
