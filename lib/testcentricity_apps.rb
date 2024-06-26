require 'test/unit'
require 'appium_lib'

require 'testcentricity_apps/version'
require 'testcentricity_apps/world_extensions'
require 'testcentricity_apps/exception_queue_helper'
require 'testcentricity_apps/utility_helpers'
require 'testcentricity_apps/appium_server'

require 'testcentricity_apps/data_objects/data_objects_helper'
require 'testcentricity_apps/data_objects/environment'

require 'testcentricity_apps/app_core/appium_connect_helper'
require 'testcentricity_apps/app_core/screen_objects_helper'
require 'testcentricity_apps/app_core/screen_object'
require 'testcentricity_apps/app_core/screen_section'

require 'testcentricity_apps/app_elements/app_element'
require 'testcentricity_apps/app_elements/alert'
require 'testcentricity_apps/app_elements/button'
require 'testcentricity_apps/app_elements/checkbox'
require 'testcentricity_apps/app_elements/image'
require 'testcentricity_apps/app_elements/label'
require 'testcentricity_apps/app_elements/list'
require 'testcentricity_apps/app_elements/menu'
require 'testcentricity_apps/app_elements/menubar'
require 'testcentricity_apps/app_elements/radio'
require 'testcentricity_apps/app_elements/selectlist'
require 'testcentricity_apps/app_elements/switch'
require 'testcentricity_apps/app_elements/textfield'


module TestCentricity
  class ScreenManager
    attr_accessor :current_screen

    @screen_objects = {}

    def self.register_screen_objects(screens)
      @screen_objects = screens
    end

    # Have all ScreenObjects been registered?
    #
    # @return [Boolean] true if all ScreenObjects have been registered
    # @example
    #   TestCentricity::ScreenManager.loaded?
    #
    def self.loaded?
      !@screen_objects.empty?
    end

    def self.find_screen(screen_name)
      screen_id = (screen_name.is_a? String) ? screen_name.gsub(/\s+/, '').downcase.to_sym : screen_name
      screen = @screen_objects[screen_id]
      raise "No screen object defined for screen named '#{screen_name}'" unless screen
      screen
    end

    # Get the currently active ScreenObject
    #
    # @return [ScreenObject]
    # @example
    #   active_screen = TestCentricity::ScreenManager.current_screen
    #
    def self.current_screen
      @current_screen
    end

    # Sets the currently active ScreenObject
    #
    # @param screen [ScreenObject] Reference to the active ScreenObject
    # @example
    #   TestCentricity::ScreenManager.current_screen = product_search_screen
    #
    def self.current_screen=(screen)
      @current_screen = screen
    end
  end


  class DataManager
    @data_objects = {}

    def self.register_data_objects(data)
      @data_objects = data
    end

    def self.find_data_object(data_object)
      @data_objects[data_object]
    end

    # Have all DataObjects been registered?
    #
    # @return [Boolean] true if all DataObjects have been registered
    # @example
    #   TestCentricity::DataManager.loaded?
    #
    def self.loaded?
      !@data_objects.empty?
    end
  end
end
