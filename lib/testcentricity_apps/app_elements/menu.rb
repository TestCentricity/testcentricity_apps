module TestCentricity
  module AppElements
    class AppMenu < AppUIElement
      attr_accessor :menu_item
      attr_accessor :key_map

      def initialize(name, parent, locator, context)
        super
        @type = :menu
        @menu_item = { class: 'XCUIElementTypeMenuItem' }
        @key_map = nil
      end

      def define_menu_elements(element_spec)
        element_spec.each do |element, value|
          case element
          when :menu_item
            @menu_item = value
          when :key_map
            @key_map = value
          else
            raise "#{element} is not a recognized menu element"
          end
        end
      end

      # Return the number of menu items in a menu object.
      #
      # @return [Integer]
      # @example
      #   num_menu_items = view_menu.get_item_count
      #
      def get_item_count
        obj = element
        object_not_found_exception(obj)
        menu_loc = get_menu_item_locator
        items = obj.find_elements(menu_loc.keys[0], menu_loc.values[0])
        items.count
      end

      # Return array of strings of all menu item captions in a menu object.
      #
      # @return [Array]
      # @example
      #   view_items = view_menu.get_menu_items
      #
      def get_menu_items
        menu_items = []
        obj = element
        object_not_found_exception(obj)
        menu_loc = get_menu_item_locator
        items = obj.find_elements(menu_loc.keys[0], menu_loc.values[0])
        items.each do |item|
          menu_items.push(item.text)
        end
        menu_items
      end

      alias get_list_items get_menu_items

      # Return text caption of menu item at specified index.
      #
      # @return [String]
      # @example
      #   menu_item_text = view_menu.get_menu_item(3)
      #
      def get_menu_item(index)
        items = get_menu_items
        items[index - 1]
      end

      alias get_list_item get_menu_item

      def get_item_data(index = nil)
        menu_items = []
        obj = element
        object_not_found_exception(obj)
        menu_loc = get_menu_item_locator
        items = obj.find_elements(menu_loc.keys[0], menu_loc.values[0])
        items.each do |item|
          caption = item.text
          state = item.enabled?
          menu_items.push(
            {
              caption: caption,
              enabled: state
            }
          )
        end
        if index.nil?
          menu_items
        else
          menu_items[index - 1]
        end
      end

      # Return enabled state of menu item at specified index.
      #
      # @return [Boolean]
      # @example
      #   menu_item_status = view_menu.get_item_enabled(3)
      #
      def get_item_enabled(index)
        obj = element
        object_not_found_exception(obj)
        menu_loc = get_menu_item_locator
        items = obj.find_elements(menu_loc.keys[0], menu_loc.values[0])
        items[index - 1].enabled?
      end

      # Select the specified menu item in a menu object using the specified selection method (mouse or keyboard shortcut).
      # Accepts a String or Integer representing either the menu item caption or item index.
      #
      # @param item [String, Integer] menu item text or index of menu item to select
      # @param method [Symbol] valid selectors are :mouse, :keys, or :keyboard (default = :mouse)
      #
      # @example
      #   view_menu.choose_menu_item(2)
      #   view_menu.choose_menu_item('Programmer')
      #
      def choose_menu_item(item, method = :mouse)
        obj = element
        object_not_found_exception(obj)
        case method
        when :mouse
          self.click unless self.visible?
          menu_loc = get_menu_item_locator
          items = obj.find_elements(menu_loc.keys[0], menu_loc.values[0])
          case
          when item == :last
            items.last.click
          when item.is_a?(Integer)
            items[item - 1].click
          else
            items.each do |list_item|
              if list_item.text == item
                list_item.click
                break
              end
            end
          end
        when :keys, :keyboard
          keys = @key_map[item]
          raise "No key map found for item #{item}" if keys.empty?
          Environ.appium_driver.execute_script('macos: keys', { keys: keys })
        else
          raise "#{method} is not a valid selector"
        end
      end

      private

      def get_menu_item_locator
        define_menu_elements({ :menu_item => { class: 'XCUIElementTypeMenuItem' } }) if @menu_item.nil?
        @menu_item
      end
    end
  end
end
