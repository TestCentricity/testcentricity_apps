module TestCentricity
  class MenuBar < TestCentricity::ScreenSection
    trait(:section_name)    { 'Menu Bar' }
    trait(:section_locator) { { class_chain: '**/XCUIElementTypeMenuBar' } }

    # Menu Bar UI elements
    list :menu_list, { xpath: '//XCUIElementTypeMenuBar' }

    def initialize(name, parent, locator, context)
      super
      @parent = nil
      # define the menu bar item element for the menu bar list object
      list_elements = { list_item: { xpath: '(//XCUIElementTypeMenuBarItem)' } }
      menu_list.define_list_elements(list_elements)
    end

    def get_object_type
      :menubar
    end

    # Declare and instantiate a single menu UI Element for this MenuBar object.
    #
    # @param element_name [Symbol] name of menu object (as a symbol)
    # @param locator [Hash] { locator_strategy: locator_identifier }
    # @example
    #   menu :convert_menu, { xpath: '//XCUIElementTypeMenuBarItem[6]' }
    #
    def self.menu(element_name, locator)
      define_section_element(element_name, TestCentricity::AppElements::AppMenu, locator)
    end

    # Declare and instantiate a collection of menus for this MenuBar object.
    #
    # @param element_hash [Hash] names of menus (as symbol) and locator Hash
    # @example
    #   menus convert_menu: { xpath: '//XCUIElementTypeMenuBarItem[6]' },
    #         view_menu:    { xpath: '//XCUIElementTypeMenuBarItem[5]' }
    #
    def self.menus(element_hash)
      element_hash.each_pair { |element_name, locator| menu(element_name, locator) }
    end

    # Return the number of menus in a MenuBar object.
    #
    # @return [Integer]
    # @example
    #   num_menus = menu_bar.get_item_count
    #
    def get_item_count
      menu_list.get_item_count
    end

    # Return array of strings of all menus in a MenuBar object.
    #
    # @return [Array]
    # @example
    #   menu_items = menu_bar.get_menubar_items
    #
    def get_menubar_items
      menu_list.get_list_items
    end

    alias get_list_items get_menubar_items

    # Return text caption of menu item at specified index.
    #
    # @return [String]
    # @example
    #   menubar_item_text = menu_bar.get_menubar_item(3)
    #
    def get_menubar_item(index)
      items = get_list_items
      items[index - 1]
    end

    alias get_list_item get_menubar_item
  end
end
