# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'service_actor/rails/version'

Gem::Specification.new do |spec|
  spec.name = 'service_actor-rails'
  spec.version = ServiceActor::Rails::VERSION

  spec.authors = ['Sunny Ripert']
  spec.email = ['sunny@sunfox.org']

  spec.summary = 'Rails support for Actor'
  spec.description =
    'Rails support for the Service Actor gem, helping you create service ' \
    'objects for your application logic.'
  spec.licenses = ['MIT']

  spec.homepage = 'https://github.com/sunny/actor-rails'
  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/master/CHANGELOG.md"

  spec.require_paths = ['lib']
  spec.extra_rdoc_files = %w[
    LICENSE.txt
    README.md
  ]

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z lib`.split("\x0")
  end

  # Actor
  spec.add_dependency 'service_actor'

  # Rails
  spec.add_dependency 'rails', '>= 6.0'

  # Tests
  spec.add_development_dependency 'rspec'

  # Test command-line applications
  spec.add_development_dependency 'aruba'

  # Development Tasks
  spec.add_development_dependency 'rake'

  # Debugger
  spec.add_development_dependency 'pry'

  # Linting
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rspec'
end
