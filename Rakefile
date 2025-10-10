require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'rake'
require 'rspec/core/rake_task'
require 'simplecov'
require 'yard'
require 'testcentricity_apps/version'


desc 'Run WIP specs'
RSpec::Core::RakeTask.new(:wip_specs) do |t|
  t.rspec_opts = '--tag wip'
end


desc 'Run required specs'
RSpec::Core::RakeTask.new(:required_specs) do |t|
  t.rspec_opts = '--tag required'
end


desc 'Run BrowserStack specs'
RSpec::Core::RakeTask.new(:browserstack_specs) do |t|
  t.rspec_opts = '--tag browserstack'
end


desc 'Run TestingBot specs'
RSpec::Core::RakeTask.new(:testingbot_specs) do |t|
  t.rspec_opts = '--tag testingbot'
end


desc 'Run Custom User-defined Cloud Driver specs'
RSpec::Core::RakeTask.new(:custom_driver_specs) do |t|
  t.rspec_opts = '--tag custom'
end


desc 'Run RN Demo Cucumber smoke test features on iOS simulator using environment variables and JSON data source'
Cucumber::Rake::Task.new(:rn_bat_ios) do |t|
  t.profile = 'rn_bat_ios'
end


desc 'Run RN Demo Cucumber regression test features on iOS simulator using W3C capabilities and YAML data source'
Cucumber::Rake::Task.new(:rn_regress_ios) do |t|
  t.profile = 'rn_regress_ios'
end


desc 'Run RN Demo Cucumber smoke test features on Android simulator using environment variables and JSON data source'
Cucumber::Rake::Task.new(:rn_bat_android) do |t|
  t.profile = 'rn_bat_android'
end


desc 'Run RN Demo Cucumber regression test features on Android simulator using W3C capabilities and YAML data source'
Cucumber::Rake::Task.new(:rn_regress_android) do |t|
  t.profile = 'rn_regress_android'
end


desc 'Run RN Demo Cucumber deeplink test features on Android physical device hosted on BrowserStack'
Cucumber::Rake::Task.new(:deeplink_bs_android) do |t|
  t.profile = 'rn_deeplink_bs_android'
end


desc 'Run RN Demo Cucumber deeplink test features on iOS 17 physical device hosted on BrowserStack'
Cucumber::Rake::Task.new(:deeplink_bs_ios17) do |t|
  t.profile = 'rn_deeplink_bs_ios17'
end


desc 'Run RN Demo Cucumber deeplink test features on OS 16 physical device hosted on BrowserStack'
Cucumber::Rake::Task.new(:deeplink_bs_ios16) do |t|
  t.profile = 'rn_deeplink_bs_ios16'
end


desc 'Run WDIO Demo Cucumber smoke test features on iOS simulator using environment variables and JSON data source'
Cucumber::Rake::Task.new(:wdio_bat_ios) do |t|
  t.profile = 'wdio_bat_ios'
end


desc 'Run WDIO Demo Cucumber smoke test features on Android simulator using environment variables and JSON data source'
Cucumber::Rake::Task.new(:wdio_bat_android) do |t|
  t.profile = 'wdio_bat_android'
end


desc 'Run WDIO Demo Cucumber regression test features on iOS simulator using W3C capabilities and YAML data source'
Cucumber::Rake::Task.new(:wdio_regress_ios) do |t|
  t.profile = 'wdio_regress_ios'
end


desc 'Run WDIO Demo Cucumber regression test features on Android simulator using W3C capabilities and YAML data source'
Cucumber::Rake::Task.new(:wdio_regress_android) do |t|
  t.profile = 'wdio_regress_android'
end


desc 'Run MacOS Calculator Cucumber regression test features using W3C capabilities and YAML data source'
Cucumber::Rake::Task.new(:calc_regress) do |t|
  t.profile = 'calc_regress'
end


desc 'Run MacOS Shortcuts Cucumber regression test features using W3C capabilities and YAML data source'
Cucumber::Rake::Task.new(:shortcuts_regress) do |t|
  t.profile = 'shortcuts_regress'
end


desc 'Run cloud service specs'
task cloud_specs: %i[browserstack_specs
                     custom_driver_specs
                     testingbot_specs]


desc 'Run required specs and Cucumber features'
task required: %i[required_specs
                  wdio_bat_android
                  wdio_bat_ios
                  rn_bat_android
                  rn_bat_ios]


desc 'Run all specs'
task all_specs: %i[required_specs
                   browserstack_specs
                   custom_driver_specs
                   testingbot_specs]


desc 'Run Cucumber smoke test features'
task smoke: %i[wdio_bat_android
               wdio_bat_ios
               rn_bat_android
               rn_bat_ios]


desc 'Run Cucumber regression test features'
task regress: %i[wdio_regress_android
                 wdio_regress_ios
                 rn_regress_android
                 rn_regress_ios
                 calc_regress
                 shortcuts_regress]


desc 'Run Cucumber deeplink test features on BrowserStack hosted real devices'
task device_deeplink: %i[deeplink_bs_android
                         deeplink_bs_ios17]


desc 'Run all specs and Cucumber features'
task all: %i[required_specs
             browserstack_specs
             custom_driver_specs
             testingbot_specs
             wdio_bat_ios
             rn_bat_android
             device_deeplink
             regress]


desc 'Update HTML docs'
YARD::Rake::YardocTask.new(:docs) do |t|
  ENV['COVERAGE'] = 'false'
  t.files = ['lib/**/*.rb']
end


desc 'Build and release new version of gem'
task :release do
  ENV['COVERAGE'] = 'false'
  version = TestCentricityApps::VERSION
  puts "Release version #{version} of TestCentricity For Apps gem, y/n?"
  exit(1) unless $stdin.gets.chomp == 'y'
  sh 'gem build testcentricity_apps.gemspec && ' \
     "gem push testcentricity_apps-#{version}.gem"
end


desc 'Update docs, build gem, and push to RubyGems'
task ship_it: %i[docs release]
