module TestCentricity
  class EnvironData < TestCentricity::DataSource
    attr_accessor	:current
    attr_accessor :data_source_type
    attr_accessor	:generic_data
    attr_accessor	:environ_specific_data

    def self.find_environ(environ_name, source_type = :yaml)
      raise 'No environment specified' if environ_name.nil?

      @data_source_type = source_type
      data = case source_type
             when :yaml
               # read generic test data from data.yml file
               @generic_data ||= YAML.load_file(YML_PRIMARY_DATA_FILE)
               # read environment specific test data
               data_file = "#{PRIMARY_DATA_PATH}#{environ_name}_data.yml"
               @environ_specific_data = if File.exist?(data_file)
                                          YAML.load_file(data_file)
                                        else
                                          {}
                                        end
               read('Environments', environ_name)
             when :json
               # read generic test data from data.json file
               raw_data = File.read(JSON_PRIMARY_DATA_FILE)
               @generic_data = JSON.parse(raw_data)
               # read environment specific test data
               data_file = "#{PRIMARY_DATA_PATH}#{environ_name}_data.json"
               @environ_specific_data = if File.exist?(data_file)
                                          raw_data = File.read(data_file)
                                          JSON.parse(raw_data)
                                        else
                                          {}
                                        end

               read('Environments', environ_name)
             else
               raise "#{source_type} is not a supported data source type"
             end
      @current = Environ.new(data)
      Environ.current = @current
    end

    def self.read(key_name, node_name)
      if @environ_specific_data.key?(key_name) && @environ_specific_data[key_name].key?(node_name)
        node_data = @environ_specific_data[key_name][node_name]
      else
        raise "No key named #{key_name} in generic and environment-specific data" unless @generic_data.key?(key_name)
        raise "No node named #{node_name} in #{key_name} section of generic and environment-specific data" unless @generic_data[key_name].key?(node_name)

        node_data = @generic_data[key_name][node_name]
      end

      if node_data.is_a?(Hash)
        node_data.each do |key, value|
          node_data[key] = calculate_dynamic_value(value) if value.to_s.start_with?('eval!')
        end
      end
      node_data
    end
  end


  class Environ < TestCentricity::DataObject
    @session_id = Time.now.strftime('%d%H%M%S%L')
    @session_time_stamp = Time.now.strftime('%Y%m%d%H%M%S')
    @test_environment = ENV['TEST_ENVIRONMENT']
    @a11y_standard = ENV['ACCESSIBILITY_STANDARD'] || 'best-practice'
    @locale = ENV['LOCALE'] || 'en'
    @language = ENV['LANGUAGE'] || 'English'
    @screen_shots = []

    attr_accessor :test_environment
    attr_accessor :session_state
    attr_accessor :session_code
    attr_accessor :app_session_id
    attr_accessor :os
    attr_accessor :device
    attr_accessor :device_name
    attr_accessor :device_type
    attr_accessor :device_os
    attr_accessor :device_os_version
    attr_accessor :device_orientation
    attr_accessor :screen_size
    attr_accessor :platform
    attr_accessor :driver
    attr_accessor :driver_name
    attr_accessor :appium_driver
    attr_accessor :tunneling
    attr_accessor :locale
    attr_accessor :language

    attr_accessor :parallel
    attr_accessor :process_num

    attr_accessor :signed_in
    attr_accessor :portal_status
    attr_accessor :portal_context

    attr_accessor :user_id
    attr_accessor :password
    attr_accessor :app_id
    attr_accessor :api_key
    attr_accessor :option1
    attr_accessor :option2
    attr_accessor :option3
    attr_accessor :option4
    attr_accessor :dns
    attr_accessor :db_username
    attr_accessor :db_password

    attr_accessor :ios_app_path
    attr_accessor :ios_ipa_path
    attr_accessor :ios_bundle_id
    attr_accessor :ios_test_id
    attr_accessor :android_apk_path
    attr_accessor :android_app_id
    attr_accessor :android_test_id
    attr_accessor :default_max_wait_time
    attr_accessor :deep_link_prefix

    attr_accessor :mac_bundle_id

    def initialize(data)
      @user_id	     = data['USER_ID']
      @password	     = data['PASSWORD']
      @app_id 	     = data['APP_ID']
      @api_key	     = data['API_KEY']
      @option1	     = data['OPTIONAL_1']
      @option2	     = data['OPTIONAL_2']
      @option3	     = data['OPTIONAL_3']
      @option4	     = data['OPTIONAL_4']
      @dns	         = data['DNS']
      @db_username   = data['DB_USERNAME']
      @db_password   = data['DB_PASSWORD']
      @ios_app_path  = data['IOS_APP_PATH']
      @ios_ipa_path  = data['IOS_IPA_PATH']
      @ios_bundle_id = data['IOS_BUNDLE_ID']
      @ios_test_id   = data['IOS_TEST_ID']
      @android_apk_path = data['ANDROID_APK_PATH']
      @android_app_id   = data['ANDROID_APP_ID']
      @android_test_id  = data['ANDROID_TEST_ID']
      @deep_link_prefix = data['DEEP_LINK_PREFIX']
      @mac_bundle_id = data['MAC_BUNDLE_ID']

      super
    end

    def self.new_app_session
      @app_session_id = Time.now.strftime('%Y%m%d%H%M%S%L')
    end

    def self.app_session_id
      @app_session_id
    end

    def self.session_code
      if @session_code.nil?
        characters = ('a'..'z').to_a
        @session_code = (0..12).map { characters.sample }.join
      end
      @session_code
    end

    def self.session_id
      @session_id
    end

    def self.session_time_stamp
      @session_time_stamp
    end

    def self.parallel=(state)
      @parallel = state
    end

    def self.parallel
      @parallel
    end

    def self.process_num=(num)
      @process_num = num
    end

    def self.process_num
      @process_num
    end

    def self.test_environment
      if @test_environment.blank?
        nil
      else
        @test_environment.downcase.to_sym
      end
    end

    def self.default_max_wait_time=(timeout)
      @default_max_wait_time = timeout
    end

    def self.default_max_wait_time
      @default_max_wait_time
    end

    def self.session_state=(session_state)
      @session_state = session_state
    end

    def self.session_state
      @session_state
    end

    def self.os=(os)
      @os = os
    end

    def self.os
      @os
    end

    def self.device=(device)
      @device = device
    end

    def self.device
      @device
    end

    def self.is_device?
      @device == :device
    end

    def self.is_simulator?
      @device == :simulator
    end

    def self.is_web?
      @device == :web
    end

    def self.device_type=(type)
      type = type.downcase.to_sym if type.is_a?(String)
      @device_type = type
    end

    def self.device_type
      @device_type
    end

    def self.device_name=(name)
      @device_name = name
    end

    def self.device_name
      @device_name
    end

    def self.device_os=(os)
      @device_os = os.downcase.to_sym
    end

    def self.device_os
      @device_os
    end

    def self.device_os_version=(version)
      @device_os_version = version
    end

    def self.device_os_version
      @device_os_version
    end

    def self.is_ios?
      @device_os == :ios
    end

    def self.is_android?
      @device_os == :android
    end

    def self.is_macos?
      @device_os == :mac
    end

    def self.device_orientation=(orientation)
      orientation = orientation.downcase.to_sym if orientation.is_a?(String)
      @device_orientation = orientation
    end

    def self.device_orientation
      @device_orientation
    end

    def self.screen_size=(size)
      @screen_size = size
    end

    def self.screen_size
      @screen_size
    end

    def self.driver=(type)
      @driver = type
    end

    def self.driver
      @driver
    end

    def self.driver_name=(name)
      name = name.downcase.to_sym if name.is_a?(String)
      @driver_name = name
    end

    def self.driver_name
      @driver_name
    end

    def self.appium_driver=(driver_instance)
      @appium_driver = driver_instance
    end

    def self.appium_driver
      @appium_driver
    end

    def self.tunneling=(state)
      @tunneling = state
    end

    def self.tunneling
      @tunneling
    end

    def self.language=(language)
      @language = language
    end

    def self.language
      @language
    end

    def self.locale=(locale)
      @locale = locale
    end

    def self.locale
      @locale
    end

    def self.platform=(platform)
      @platform = platform
    end

    def self.platform
      @platform
    end

    def self.is_mobile?
      @platform == :mobile
    end

    def self.set_signed_in(signed_in)
      @signed_in = signed_in
    end

    def self.is_signed_in?
      @signed_in
    end

    def self.portal_state=(portal_state)
      @portal_status = portal_state
    end

    def self.portal_state
      @portal_status
    end

    def self.portal_context=(portal_context)
      @portal_context = portal_context
    end

    def self.portal_context
      @portal_context
    end

    def self.set_external_page(state)
      @external_page = state
    end

    def self.save_screen_shot(screen_shot)
      @screen_shots.push(screen_shot)
    end

    def self.get_screen_shots
      @screen_shots
    end

    def self.reset_contexts
      @screen_shots = []
    end

    # :nocov:
    def self.report_header
      # build the Cucumber HTML report header
      report_header = "\n<b><u>TEST ENVIRONMENT</u>:</b> #{ENV['TEST_ENVIRONMENT']}\n"
      report_header = "#{report_header}  <b>Driver:</b>\t #{Environ.driver}\n" if Environ.driver
      report_header = "#{report_header}  <b>Driver Name:</b>\t #{Environ.driver_name}\n" if Environ.driver_name
      report_header = "#{report_header}  <b>Platform:</b>\t #{Environ.platform}\n" if Environ.platform
      report_header = "#{report_header}  <b>Device:</b>\t #{Environ.device_name}\n" if Environ.device_name
      report_header = "#{report_header}  <b>Device OS:</b>\t #{Environ.device_os} #{Environ.device_os_version}\n" if Environ.device_os
      report_header = "#{report_header}  <b>Device type:</b>\t #{Environ.device_type}\n" if Environ.device_type
      report_header = "#{report_header}  <b>OS:</b>\t\t #{Environ.os}\n" if Environ.os
      report_header = "#{report_header}  <b>Locale:</b>\t #{Environ.locale}\n" if Environ.locale
      report_header = "#{report_header}  <b>Language:</b>\t #{Environ.language}\n" if Environ.language
      report_header = "#{report_header}  <b>Country:</b>\t #{ENV['COUNTRY']}\n" if ENV['COUNTRY']
      "#{report_header}\n\n"
    end
    # :nocov:
  end
end
