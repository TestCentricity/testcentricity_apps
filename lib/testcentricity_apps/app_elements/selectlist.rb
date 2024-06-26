module TestCentricity
  module AppElements
    class AppSelectList < AppUIElement
      attr_accessor :list_item

      def initialize(name, parent, locator, context)
        super
        @type = :selectlist
        @list_item = case Environ.device_os
                     when :mac
                       { class: 'XCUIElementTypeMenuItem' }
                     when :ios
                       { class: 'XCUIElementTypeOther' }
                     when :android
                       { class: 'android.view.ViewGroup' }
                     else
                       nil
                     end
      end

      def define_list_elements(element_spec)
        element_spec.each do |element, value|
          case element
          when :list_item
            @list_item = value
          else
            raise "#{element} is not a recognized selectlist element"
          end
        end
      end

      # Return the number of items in a list object.
      #
      # @return [Integer]
      # @example
      #   num_convert_items = convert_list.get_list_items
      #
      def get_item_count
        obj = element
        object_not_found_exception(obj)
        if Environ.is_ios? && obj.attribute(:type) == 'XCUIElementTypePickerWheel'
          raise 'This method is not supported for XCUIElementTypePickerWheel controls'
        end
        list_loc = get_list_item_locator
        self.click if Environ.is_macos?
        items = obj.find_elements(list_loc.keys[0], list_loc.values[0])
        self.click if Environ.is_macos?
        items.count
      end

      # Return array of strings of all items in a selectlist object.
      #
      # @return [Array]
      # @example
      #   convert_items = convert_list.get_list_items
      #
      def get_list_items
        list_items = []
        obj = element
        object_not_found_exception(obj)
        if Environ.is_ios? && obj.attribute(:type) == 'XCUIElementTypePickerWheel'
          raise 'This method is not supported for XCUIElementTypePickerWheel controls'
        end
        list_loc = get_list_item_locator
        self.click if Environ.is_macos?
        items = obj.find_elements(list_loc.keys[0], list_loc.values[0])
        items.each do |item|
          list_items.push(item.text)
        end
        self.click if Environ.is_macos?
        list_items
      end

      def get_list_item(index)
        items = get_list_items
        items[index - 1]
      end

      # Select the specified item in a selectlist object. Accepts a String or Integer.
      #
      # @param item [String, Integer] text or index of item to select
      #
      # @example
      #   convert_list.choose_item(2)
      #   convert_list.choose_item('Power')
      #
      def choose_item(item)
        obj = element
        object_not_found_exception(obj)
        if Environ.is_ios? && obj.attribute(:type) == 'XCUIElementTypePickerWheel'
          obj.send_keys(item)
        else
          list_loc = get_list_item_locator
          self.click if Environ.is_macos?
          items = obj.find_elements(list_loc.keys[0], list_loc.values[0])
          if item.is_a?(Integer)
            items[item - 1].click
          else
            items.each do |list_item|
              if list_item.text == item
                list_item.click
                break
              end
            end
          end
        end
      end

      private

      def get_list_item_locator
        if @list_item.nil?
          case Environ.device_os
          when :mac
            define_list_elements({ :list_item => { class: 'XCUIElementTypeMenuItem' } } )
          when :ios
            define_list_elements({ :list_item => { class: 'XCUIElementTypeOther' } } )
          when :android
            define_list_elements({ :list_item => { class: 'android.view.ViewGroup' } } )
          end
        end
        @list_item
      end
    end
  end
end
