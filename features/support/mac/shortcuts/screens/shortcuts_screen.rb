class ShortcutsAppScreen < TestCentricity::ScreenObject
  trait(:screen_name)    { 'Shortcuts' }
  trait(:screen_locator) { { class_chain: '**/XCUIElementTypeWindow' } }
  trait(:sidebar_pop_menu_items) do
    [
      'Rename',
      'Edit Icon…',
      'Delete'
    ]
  end
  trait(:shortcut_pop_menu_items) do
    [
      'Run',
      'Edit',
      'Rename',
      'Change Icon',
      'Add to Dock',
      'Share',
      '',
      'Duplicate',
      'Delete'
    ]
  end

  # Shortcuts screen UI elements
  tables   sidebar_table:   { predicate: 'identifier == "library.sidebar"' },
           view_table:      { predicate: 'identifier == "view.library.table"' }
  elements view_splitter:   { class: 'XCUIElementTypeSplitter' },
           gallery_page:    { predicate: 'identifier == "gallery.page."' }
  buttons  close_button:    { predicate: 'identifier == "_XCUI:CloseWindow"' },
           zoom_button:     { predicate: 'identifier == "_XCUI:FullScreenWindow"' },
           minimize_button: { predicate: 'identifier == "_XCUI:MinimizeWindow"' }
  label    :window_title,   { class_chain: '**/XCUIElementTypeStaticText' }
  menu     :popup_menu,     { class_chain: '**/XCUIElementTypeTable/XCUIElementTypeMenu' }
  menubar  :shortcuts_menu_bar, ShortcutsMenuBar

  def initialize
    super
    # define the cell element for the Shortcuts table object
    table_spec = { table_cell: { class_chain: '**/XCUIElementTypeCell/XCUIElementTypeGroup/XCUIElementTypeStaticText' } }
    view_table.define_table_elements(table_spec)
  end

  def verify_screen_ui
    sidebar_table.wait_until_row_count_is(8, 5)
    ui = {
      window_title => { value: 'All Shortcuts' },
      close_button => {
        enabled: true,
        visible: true
      },
      zoom_button => {
        enabled: true,
        visible: true
      },
      minimize_button => {
        enabled: true,
        visible: true
      },
      view_splitter => {
        visible: true,
        enabled: false,
        value: '225'
      },
      sidebar_table => {
        visible: true,
        enabled: true,
        rowcount: 8,
        columncount: 1,
        { row: 1 } => [['Gallery', '']],
        { column: 1 } => [['Gallery', 'Shortcuts', 'All Shortcuts', 'Share Sheet', 'Quick Actions', 'Menu Bar', 'Folders', '4']],
        { cell: [4, 1] } => ['Share Sheet']
      },
      view_table => {
        visible: true,
        enabled: true,
        rowcount: 6,
        columncount: 3,
        column_headers: ['Name', 'Actions', 'Last Modified'],
        { row: 1 } => [['Weekday Wake up', '2 actions', '11/30/21, 8:22 AM']],
        { column: 1 } => [['Weekday Wake up', 'Starter Shortcuts', 'Take a Break', 'Text Last Image', 'Shazam shortcut', 'Music Quiz']],
        { cell: [3, 2] } => ['13 actions']
      },
      gallery_page => { visible: false }
    }
    verify_ui_states(ui)

    result = view_table.find_in_table_row(5, '32 actions')
    assert_equal(2, result, 'Expected result to be column 2')

    result = view_table.find_in_table_column(2, '13 actions')
    assert_equal(3, result, 'Expected result to be row 3')
  end

  def verify_gallery
    ui = {
      window_title => { value: 'Gallery' },
      close_button => {
        enabled: true,
        visible: true
      },
      zoom_button => {
        enabled: true,
        visible: true
      },
      minimize_button => {
        enabled: true,
        visible: true
      },
      sidebar_table => {
        visible: true,
        enabled: true,
        rowcount: 8,
        columncount: 1
      },
      view_table => { visible: false },
      gallery_page => { visible: true }
    }
    verify_ui_states(ui)
  end

  def verify_menubar
    shortcuts_menu_bar.verify_menu_bar
  end

  def perform_sidebar_action(action, item_name)
    sidebar_row = if item_name.gsub(/\s+/, '_').downcase.to_sym == :starter_shortcuts
                    8
                  else
                    sidebar_table.find_in_table_column(1, item_name)
                  end
    raise "An item named #{item_name} could not be found" if sidebar_row.nil?

    action = action.gsub(/\s+/, '_').downcase.to_sym unless action.is_a?(Symbol)
    case action
    when :click, :tap
      sidebar_table.tap_table_cell(sidebar_row, 1)
    when :right_click
      sidebar_table.right_click_table_cell(sidebar_row, 1)
    else
      raise "#{action} is not a supported action"
    end
  end

  def perform_view_action(action, shortcut_name)
    shortcut_row = view_table.find_in_table_column(1, shortcut_name)
    raise "A shortcut named #{shortcut_name} could not be found" if shortcut_row.nil?

    action = action.gsub(/\s+/, '_').downcase.to_sym unless action.is_a?(Symbol)
    case action
    when :click, :tap
      view_table.tap_table_cell(shortcut_row, 1)
    when :double_click, :double_tap
      view_table.double_tap_table_cell(shortcut_row, 1)
    when :right_click
      view_table.right_click_table_cell(shortcut_row, 1)
    else
      raise "#{action} is not a supported action"
    end
  end

  def choose_popmenu_item(menu_item, shortcut_name)
    perform_view_action(:right_click, shortcut_name)
    popup_menu.wait_until_visible(2)
    popup_menu.choose_menu_item(menu_item)
  end

  def verify_shortcut_popup_menu
    ui = {
      popup_menu => {
        visible: true,
        enabled: true,
        itemcount: shortcut_pop_menu_items.count,
        items: shortcut_pop_menu_items
      }
    }
    verify_ui_states(ui)
  end

  def verify_sidebar_popup_menu
    ui = {
      popup_menu => {
        visible: true,
        enabled: true,
        itemcount: sidebar_pop_menu_items.count,
        items: sidebar_pop_menu_items
      }
    }
    verify_ui_states(ui)
  end

  def verify_library_table(item_name)
    item_name = item_name.gsub(/\s+/, '_').downcase.to_sym unless item_name.is_a?(Symbol)
    items = case item_name
            when :all_shortcuts
              ['Weekday Wake up', 'Starter Shortcuts', 'Take a Break', 'Text Last Image', 'Shazam shortcut', 'Music Quiz']
            when :starter_shortcuts
              ['Take a Break', 'Text Last Image', 'Shazam shortcut', 'Music Quiz']
            else
              raise "#{item_name} is not a supported item"
            end
    ui = {
      view_table => {
        visible: true,
        enabled: true,
        rowcount: items.count,
        columncount: 3,
        column_headers: ['Name', 'Actions', 'Last Modified'],
        { column: 1 } => [items]
      }
    }
    verify_ui_states(ui)
  end
end
