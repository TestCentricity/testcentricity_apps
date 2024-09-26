# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'testcentricity_apps/version'

Gem::Specification.new do |spec|
  spec.name          = 'testcentricity_apps'
  spec.version       = TestCentricityApps::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 3.0.0'
  spec.authors       = ['A.J. Mrozinski']
  spec.email         = ['support@testcentricity.com']
  spec.summary       = 'A Screen Object Model Framework for MacOS desktop app and iOS and/or Android mobile app testing'
  spec.description   = '
    The TestCentricity™ For Apps core framework for MacOS desktop app and iOS and Android mobile app testing implements a
    Screen Object Model DSL for use with Cucumber or RSpec and Appium 2.x. The gem also facilitates the configuration of
    the appropriate Appium capabilities required to establish a connection with locally hosted MacOS apps or locally or
    cloud hosted iOS or Android devices or simulators (using BrowserStack, Sauce Labs, or TestingBot services).'
  spec.homepage      = 'https://github.com/TestCentricity/testcentricity_apps'
  spec.license       = 'BSD-3-Clause'
  spec.metadata = {
    'changelog_uri' => 'https://github.com/TestCentricity/testcentricity_apps/blob/master/CHANGELOG.md',
    'bug_tracker_uri' => 'https://github.com/TestCentricity/testcentricity_apps/issues',
    'wiki_uri' => 'https://github.com/TestCentricity/testcentricity_apps/wiki',
    'documentation_uri' => 'https://www.rubydoc.info/gems/testcentricity_apps',
    'homepage_uri' => 'https://github.com/TestCentricity/testcentricity_apps'
  }

  spec.files         = Dir.glob('lib/**/*') + %w[README.md CHANGELOG.md LICENSE.md .yardopts]
  spec.require_paths = ['lib']
  spec.requirements  << 'Appium'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'cucumber', '9.2.0'
  spec.add_development_dependency 'parallel_tests'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'require_all', '=1.5.0'
  spec.add_development_dependency 'rspec', '>= 3.13.0'
  spec.add_development_dependency 'simplecov', ['~> 0.18']
  spec.add_development_dependency 'yard', ['>= 0.9.0']

  spec.add_runtime_dependency 'appium_lib', '~> 15.2.2'
  spec.add_runtime_dependency 'childprocess'
  spec.add_runtime_dependency 'chronic', '0.10.2'
  spec.add_runtime_dependency 'faker'
  spec.add_runtime_dependency 'i18n'
  spec.add_runtime_dependency 'json'
  spec.add_runtime_dependency 'selenium-webdriver', '4.25.0'
  spec.add_runtime_dependency 'test-unit'
  spec.add_runtime_dependency 'virtus'
end
