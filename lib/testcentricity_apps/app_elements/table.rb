module TestCentricity
  module AppElements
    class AppTable < AppUIElement
      attr_accessor :table_row, :table_column, :table_cell, :table_header, :table_header_cell, :table_row_expand

      def initialize(name, parent, locator, context)
        super
        @type = :table
        table_spec = if %i[mac ios].include?(Environ.device_os)
                       {
                         table_row: { class: 'XCUIElementTypeTableRow' },
                         table_column: { class: 'XCUIElementTypeTableColumn' },
                         table_cell: { class_chain: '**/XCUIElementTypeCell/XCUIElementTypeStaticText' },
                         table_header: { class: 'XCUIElementTypeGroup' },
                         table_header_cell: { class: 'XCUIElementTypeButton' },
                         table_row_expand: { class: 'XCUIElementTypeDisclosureTriangle' },
                       }
                     else
                       {
                         table_row: nil,
                         table_column: nil,
                         table_cell: nil,
                         table_header: nil,
                         table_header_cell: nil,
                         table_row_expand: nil,
                       }
                     end
        define_table_elements(table_spec)
      end

      def define_table_elements(element_spec)
        element_spec.each do |element, value|
          case element
          when :table_row
            @table_row = value
          when :table_column
            @table_column = value
          when :table_cell
            @table_cell = value
          when :table_header
            @table_header = value
          when :table_header_cell
            @table_header_cell = value
          when :table_row_expand
            @table_row_expand = value
          else
            raise "#{element} is not a recognized table element"
          end
        end
      end

      # Return number of rows in a table object.
      #
      # @return [Integer]
      # @example
      #   num_rows = sidebar_table.get_row_count
      #
      def get_row_count
        obj = element
        object_not_found_exception(obj)
        row_loc = get_row_locator
        items = obj.find_elements(row_loc.keys[0], row_loc.values[0])
        items.count
      end

      # Return number of columns in a table object.
      #
      # @return [Integer]
      # @example
      #   num_columns = sidebar_table.get_column_count
      #
      def get_column_count
        obj = element
        object_not_found_exception(obj)
        col_loc = get_column_locator
        items = obj.find_elements(col_loc.keys[0], col_loc.values[0])
        items.count
      end

      # Wait until the table's row count equals the specified value, or until the specified wait time has expired. If the wait
      # time is nil, then the wait time will be Environ.default_max_wait_time.
      #
      # @param value [Integer or Hash] value expected or comparison hash
      # @param seconds [Integer or Float] wait time in seconds
      # @example
      #   sidebar_table.wait_until_row_count_is(10, 15)
      #     or
      #   sidebar_table.wait_until_row_count_is({ greater_than_or_equal: 1 }, 5)
      #
      def wait_until_row_count_is(value, seconds = nil, post_exception = true)
        timeout = seconds.nil? ? Environ.default_max_wait_time : seconds
        wait = Selenium::WebDriver::Wait.new(timeout: timeout)
        wait.until { compare(value, get_row_count) }
      rescue
        if post_exception
          raise "Value of Table #{object_ref_message} failed to equal '#{value}' after #{timeout} seconds" unless get_row_count == value
        else
          get_row_count == value
        end
      end

      # Wait until the table's row count changes to a different value, or until the specified wait time has expired. If the
      # wait time is nil, then the wait time will be Environ.default_max_wait_time.
      #
      # @param seconds [Integer or Float] wait time in seconds
      # @example
      #   sidebar_table.wait_until_row_count_changes(5)
      #
      def wait_until_row_count_changes(seconds = nil, post_exception = true)
        value = get_row_count
        timeout = seconds.nil? ? Environ.default_max_wait_time : seconds
        wait = Selenium::WebDriver::Wait.new(timeout: timeout)
        wait.until { get_row_count != value }
      rescue
        if post_exception
          raise "Value of Table #{object_ref_message} failed to change from '#{value}' after #{timeout} seconds" if get_row_count == value
        else
          get_row_count == value
        end
      end

      # Return array of strings of all values in each cell in the specified row of a table object.
      #
      # @return [Array]
      # @example
      #   sidebar_row_data = sidebar_table.get_table_row(4)
      #
      def get_table_row(row)
        columns = []
        # find table element
        obj = element
        object_not_found_exception(obj)
        # find all rows in table
        row_loc = get_row_locator
        rows = obj.find_elements(row_loc.keys[0], row_loc.values[0])
        raise "Row #{row} exceeds number of rows (#{rows.count}) in table #{object_ref_message}" if row > rows.count

        # find all cells in the desired row
        row_obj = rows[row - 1]
        cell_loc = get_cell_locator
        items = row_obj.find_elements(cell_loc.keys[0], cell_loc.values[0])
        # retrieve caption for each cell in table row
        items.each do |item|
          columns.push(item.text)
        end
        columns
      end

      # Return array of strings of all values in each cell in the specified column of a table object.
      #
      # @return [Array]
      # @example
      #   sidebar_col_data = sidebar_table.get_table_column(2)
      #
      def get_table_column(column)
        row_data = []
        column_count = get_column_count
        raise "Column #{column} exceeds number of columns (#{column_count}) in table #{object_ref_message}" if column > column_count

        # find table element
        obj = element
        object_not_found_exception(obj)
        # find all rows in table
        row_loc = get_row_locator
        rows = obj.find_elements(row_loc.keys[0], row_loc.values[0])
        # find all cells in the current row
        cell_loc = get_cell_locator
        rows.each do |row|
          cells = row.find_elements(cell_loc.keys[0], cell_loc.values[0])
          # retrieve caption from cell in specified column
          cell_obj = cells[column - 1]
          value = ''
          value = cell_obj.text unless cell_obj.nil?
          row_data.push(value)
        end
        row_data
      end

      # Return text contained in specified cell of a table object.
      #
      # @param row [Integer] row number
      # @param column [Integer] column number
      # @return [String] value of table cell
      # @example
      #   sidebar_table.get_table_cell(4, 5)
      #
      def get_table_cell(row, column)
        cell_obj = find_cell(row, column)
        value = ''
        value = cell_obj.text unless cell_obj.nil?
        value
      end

      # Return array of strings of all captions in each cell in the header of a table object.
      #
      # @return [Array]
      # @example
      #   sidebar_header = sidebar_table.get_header_columns
      #
      def get_header_columns
        header = []
        obj = element
        object_not_found_exception(obj)
        header_loc = get_header_locator
        header_obj = obj.find_element(header_loc.keys[0], header_loc.values[0])
        raise "Could not find header object for table #{object_ref_message}" if header_obj.nil?

        header_cell_loc = get_header_cell_locator
        items = header_obj.find_elements(header_cell_loc.keys[0], header_cell_loc.values[0])
        items.each do |item|
          header.push(item.text)
        end
        header
      end

      # Search for the specified text value in the specified row of the table object.
      # Returns the number of the first column that contains the search value.
      #
      # @param row [Integer] row number
      # @param search_value [String] value to be searched for
      # @return [Integer] column number of table cell that contains search value
      # @example
      #   bom_table.find_in_table_row(4, 'High-speed Framus bolts')
      #
      def find_in_table_row(row, search_value)
        (1..get_column_count).each do |column|
          return column if get_table_cell(row, column) == search_value
        end
        nil
      end

      # Search for the specified text value in the specified column of the table object.
      # Returns the number of the first row that contains the search value.
      #
      # @param column [Integer] column number
      # @param search_value [String] value to be searched for
      # @return [Integer] row number of table cell that contains search value
      # @example
      #   playlist_table.find_in_table_column(1, 'Ashes to Ashes')
      #
      def find_in_table_column(column, search_value)
        (1..get_row_count).each do |row|
          return row if get_table_cell(row, column) == search_value
        end
        nil
      end

      # Tap in the specified cell in a table object.
      #
      # @param row [Integer] row number
      # @param column [Integer] column number
      # @example
      #   playlist_table.tap_table_cell(3, 5)
      #
      def tap_table_cell(row, column)
        cell_obj = find_cell(row, column)
        raise "Cell [#{row}, #{column}] not found in table #{object_ref_message}" if cell_obj.nil?

        if Environ.is_macos?
          Environ.appium_driver.execute_script('macos: click', { elementId: cell_obj.id })
        else
          driver.action
                .click_and_hold(cell_obj)
                .release
                .perform
        end
      end

      # Double-tap in the specified cell in a table object.
      #
      # @param row [Integer] row number
      # @param column [Integer] column number
      # @example
      #   playlist_table.double_tap_table_cell(3, 5)
      #
      def double_tap_table_cell(row, column)
        cell_obj = find_cell(row, column)
        raise "Cell [#{row}, #{column}] not found in table #{object_ref_message}" if cell_obj.nil?

        if Environ.is_macos?
          Environ.appium_driver.execute_script('macos: doubleClick', { elementId: cell_obj.id })
        else
          driver.action
                .click_and_hold(cell_obj)
                .release
                .pause(duration: 0.2)
                .click_and_hold(cell_obj)
                .release
                .perform
        end
      end

      # Right click in the specified cell in a table object.
      #
      # @param row [Integer] row number
      # @param column [Integer] column number
      # @example
      #   playlist_table.right_click_table_cell(3, 5)
      #
      def right_click_table_cell(row, column)
        raise "Right click is not supported for #{Environ.device_os} platforms" unless Environ.is_macos?

        cell_obj = find_cell(row, column)
        raise "Cell [#{row}, #{column}] not found in table #{object_ref_message}" if cell_obj.nil?

        Environ.appium_driver.execute_script('macos: rightClick', { elementId: cell_obj.id })
      end

      def row_selected?(row)
        cell_obj = find_cell(row, 1)
        cell_obj.selected?
      end

      private

      def get_row_locator
        if @table_row.nil?
          case Environ.device_os
          when :mac, :ios
            define_table_elements({ :table_row => { class: 'XCUIElementTypeTableRow' } })
          when :android
            raise 'No table_row element defined'
          end
        end
        @table_row
      end

      def get_column_locator
        if @table_column.nil?
          case Environ.device_os
          when :mac, :ios
            define_table_elements({ :table_column => { class: 'XCUIElementTypeTableColumn' } })
          when :android
            raise 'No table_column element defined'
          end
        end
        @table_column
      end

      def get_cell_locator
        if @table_cell.nil?
          case Environ.device_os
          when :mac, :ios
            define_table_elements({ :table_cell => { class_chain: '**/XCUIElementTypeCell/XCUIElementTypeStaticText' } })
          when :android
            raise 'No table_cell element defined'
          end
        end
        @table_cell
      end

      def get_header_locator
        if @table_header.nil?
          case Environ.device_os
          when :mac, :ios
            define_table_elements({ :table_header => { class: 'XCUIElementTypeGroup' } })
          when :android
            raise 'No table_header element defined'
          end
        end
        @table_header
      end

      def get_header_cell_locator
        if @table_header_cell.nil?
          case Environ.device_os
          when :mac, :ios
            define_table_elements({ :table_header_cell => { class: 'XCUIElementTypeButton' } })
          when :android
            raise 'No table_header_cell element defined'
          end
        end
        @table_header_cell
      end

      def find_cell(row, column)
        column_count = get_column_count
        raise "Column #{column} exceeds number of columns (#{column_count}) in table #{object_ref_message}" if column > column_count

        # find table element
        obj = element
        object_not_found_exception(obj)
        # find all rows in table
        row_loc = get_row_locator
        rows = obj.find_elements(row_loc.keys[0], row_loc.values[0])
        raise "Row #{row} exceeds number of rows (#{rows.count}) in table #{object_ref_message}" if row > rows.count

        # find all cells in the desired row
        row_obj = rows[row - 1]
        cell_loc = get_cell_locator
        cells = row_obj.find_elements(cell_loc.keys[0], cell_loc.values[0])
        # return cell in specified column
        cells[column - 1]
      end
    end
  end
end
