# frozen_string_literal: true

describe TestCentricity::AppiumConnect, wip: true do
  before(:context) do
    # instantiate MacOS Calculator Demo test environment
    @environs ||= EnvironData
    @environs.find_environ('CALCULATOR_DEMO', :yaml)
    # start Appium server
    $server = TestCentricity::AppiumServer.new
    $server.start
  end

  describe 'Connect to locally hosted MacOS app using W3C desired_capabilities hash' do
    let(:mac_caps) {
      {
        driver: :appium,
        device_type: :mac,
        endpoint: 'http://127.0.0.1:4723',
        capabilities: {
          platformName: :mac,
          'appium:automationName': 'mac2',
          'appium:bundleId': Environ.current.mac_bundle_id
        }
      }
    }

    it 'connects to MacOS app using desired_capabilities hash' do
      AppiumConnect.initialize_appium(mac_caps)
      verify_mac_connect
      expect($driver).to eq(nil)
    end

    it 'connects to MacOS app with a user-defined driver name' do
      options = {
        driver: :appium,
        device_type: :mac,
        driver_name: :my_custom_mac_driver,
        capabilities: {
          platformName: :mac,
          'appium:automationName': 'mac2',
          'appium:bundleId': Environ.current.mac_bundle_id
        }
      }
      AppiumConnect.initialize_appium(options)
      verify_mac_connect(driver_name = :my_custom_mac_driver)
    end

    it 'verifies MacOS app is running in foreground' do
      AppiumConnect.initialize_appium(mac_caps)
      expect(AppiumConnect.app_state).to eq(:running_in_foreground)
    end

    it 'verifies MacOS app can be suspended and activated' do
      AppiumConnect.initialize_appium(mac_caps)
      # verify app suspension
      AppiumConnect.activate_app('com.apple.Terminal')
      sleep(4)
      expect(AppiumConnect.app_state).to eq(:running_in_background)
      # verify app activation
      AppiumConnect.terminate_app('com.apple.Terminal')
      AppiumConnect.activate_app
      expect(AppiumConnect.app_state).to eq(:running_in_foreground)
    end

    it 'verifies MacOS app is terminated' do
      AppiumConnect.initialize_appium(mac_caps)
      AppiumConnect.terminate_app
      expect(AppiumConnect.app_state).to eq(:not_running)
    end

    it 'connects to MacOS app with global driver scope' do
      options = {
        driver: :appium,
        device_type: :mac,
        global_driver: true,
        capabilities: {
          platformName: :mac,
          'appium:automationName': 'mac2',
          'appium:bundleId': Environ.current.mac_bundle_id
        }
      }
      AppiumConnect.initialize_appium(options)
      expect($driver).to eq(Environ.appium_driver)
    end
  end

  def verify_mac_connect(driver_name = nil)
    # verify Environs are correctly set
    expect(Environ.driver).to eq(:appium)
    # expect(Environ.platform).to eq(:mac)
    # expect(Environ.device).to eq(:mac)
    expect(Environ.device_type).to eq(:mac)
    expect(Environ.device_os).to eq(:mac)
    expect(Environ.appium_driver).not_to eq(nil)
    expect(Environ.is_macos?).to eq(true)
    expect(Environ.is_ios?).to eq(false)
    expect(Environ.is_android?).to eq(false)
    expect(Environ.is_web?).to eq(false)
    driver_name = "appium_#{Environ.device_os}_#{Environ.device_type}".downcase.to_sym if driver_name.nil?
    expect(Environ.driver_name).to eq(driver_name)
  end

  after(:each) do
    AppiumConnect.quit_driver
  end

  after(:context) do
    $server.stop if Environ.driver == :appium && $server.running?
  end
end
