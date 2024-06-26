class CalculatorMenuBar < TestCentricity::MenuBar
  # Menu Bar UI elements
  menus calc_menu:        { class_chain: '**/XCUIElementTypeMenuBarItem[2]' },
        file_menu:        { class_chain: '**/XCUIElementTypeMenuBarItem[3]' },
        edit_menu:        { class_chain: '**/XCUIElementTypeMenuBarItem[4]' },
        view_menu:        { class_chain: '**/XCUIElementTypeMenuBarItem[5]' },
        view_sub_menu:    { predicate: 'identifier == "_NS:335"' },
        convert_menu:     { class_chain: '**/XCUIElementTypeMenuBarItem[6]' },
        convert_sub_menu: { predicate: 'identifier == "_NS:352"' },
        speech_menu:      { class_chain: '**/XCUIElementTypeMenuBarItem[7]' },
        window_menu:      { class_chain: '**/XCUIElementTypeMenuBarItem[8]' },
        help_menu:        { class_chain: '**/XCUIElementTypeMenuBarItem[9]' }

  def initialize(name, parent, locator, context)
    super
    # define key map for Calculator menu
    menu_items = {
      key_map: {
        3 => [key: 'h', modifierFlags: XCUIKeyModifierCommand],
        7 => [key: 'q', modifierFlags: XCUIKeyModifierCommand]
      }
    }
    calc_menu.define_menu_elements(menu_items)
    # define key map for File menu
    menu_items = {
      key_map: { 1 => [key: 'w', modifierFlags: XCUIKeyModifierCommand] }
    }
    file_menu.define_menu_elements(menu_items)
    # define key map for Edit menu
    menu_items = {
      key_map: {
        5 => [key: 'c', modifierFlags: XCUIKeyModifierCommand],
        6 => [key: 'v', modifierFlags: XCUIKeyModifierCommand]
      }
    }
    edit_menu.define_menu_elements(menu_items)
    # define key map for View menu
    menu_items = {
      key_map: {
        1 => [key: '1', modifierFlags: XCUIKeyModifierCommand],
        2 => [key: '2', modifierFlags: XCUIKeyModifierCommand],
        3 => [key: '3', modifierFlags: XCUIKeyModifierCommand],
        7 => [key: 'r', modifierFlags: XCUIKeyModifierCommand]
      }
    }
    view_menu.define_menu_elements(menu_items)
    # define key map for Window menu
    menu_items = {
      key_map: { 'Show Paper Tape' => [key: 't', modifierFlags: XCUIKeyModifierCommand] }
    }
    window_menu.define_menu_elements(menu_items)
  end

  def verify_menu_bar(mode)
    ui = {
      self => {
        enabled: true,
        items: %w[Apple Calculator File Edit View Convert Speech Window Help],
        itemcount: 9,
        { item: 5 } => ['View']
      },
      calc_menu => {
        enabled: true,
        itemcount: 8,
        item_data: [
          { caption: 'About Calculator', enabled: true },
          { caption: '', enabled: false },
          { caption: 'Hide Calculator', enabled: true },
          { caption: 'Hide Others', enabled: true },
          { caption: 'Show All', enabled: false },
          { caption: '', enabled: false },
          { caption: 'Quit Calculator', enabled: true },
          { caption: 'Quit and Keep Windows', enabled: true }
        ]
      },
      file_menu => {
        enabled: true,
        item_data: [
          { caption: 'Close', enabled: true },
          { caption: 'Close All', enabled: true },
          { caption: 'Save Tape As…', enabled: true },
          { caption: '', enabled: false },
          { caption: 'Page Setup…', enabled: true },
          { caption: 'Print Tape…', enabled: true }
        ]
      },
      edit_menu => {
        enabled: true,
        item_data: [
          { caption: 'Undo', enabled: false },
          { caption: 'Redo', enabled: false },
          { caption: '', enabled: false },
          { caption: 'Cut', enabled: false },
          { caption: 'Copy', enabled: true },
          { caption: 'Paste', enabled: true },
          { caption: 'Clear', enabled: mode == :programmer},
          { caption: 'Select All', enabled: false },
          { caption: '', enabled: false },
          { caption: 'Start Dictation…', enabled: true },
          { caption: 'Emoji & Symbols', enabled: true }
        ],
        { item_enabled: 7 } => [mode == :programmer]
      },
      view_menu => {
        enabled: true,
        item_data: [
          { caption: 'Basic', enabled: true },
          { caption: 'Scientific', enabled: true },
          { caption: 'Programmer', enabled: true },
          { caption: '', enabled: false },
          { caption: 'Show Thousands Separators', enabled: true },
          { caption: '', enabled: false },
          { caption: 'RPN Mode', enabled: true },
          { caption: '', enabled: false },
          { caption: 'Decimal Places', enabled: true },
          { caption: 'Enter Full Screen', enabled: false },
          { caption: '0', enabled: true },
          { caption: '1', enabled: true },
          { caption: '2', enabled: true },
          { caption: '3', enabled: true },
          { caption: '4', enabled: true },
          { caption: '5', enabled: true },
          { caption: '6', enabled: true },
          { caption: '7', enabled: true },
          { caption: '8', enabled: true },
          { caption: '9', enabled: true },
          { caption: '10', enabled: true },
          { caption: '11', enabled: true },
          { caption: '12', enabled: true },
          { caption: '13', enabled: true },
          { caption: '14', enabled: true },
          { caption: '15', enabled: true }
        ]
      },
      convert_menu => {
        enabled: true,
        { item_data: 4 } => [{ caption: 'Currency…', enabled: mode != :programmer }],
        item_data: [
          { caption: 'Recent Conversions', enabled: true },
          { caption: '', enabled: false },
          { caption: 'Area…', enabled: mode != :programmer },
          { caption: 'Currency…', enabled: mode != :programmer },
          { caption: 'Energy or Work…', enabled: mode != :programmer },
          { caption: 'Length…', enabled: mode != :programmer },
          { caption: 'Power…', enabled: mode != :programmer },
          { caption: 'Pressure…', enabled: mode != :programmer },
          { caption: 'Speed…', enabled: mode != :programmer },
          { caption: 'Temperature…', enabled: mode != :programmer },
          { caption: 'Time…', enabled: mode != :programmer },
          { caption: 'Volume…', enabled: mode != :programmer },
          { caption: 'Weights and Masses…', enabled: mode != :programmer },
          { caption: 'Clear Menu', enabled: false }
        ]
       },
      speech_menu => {
        enabled: true,
        itemcount: 2,
        items: ['Speak Button Pressed', 'Speak Result'],
        { item: 2 } => ['Speak Result'],
        item_data: [
          { caption: 'Speak Button Pressed', enabled: true },
          { caption: 'Speak Result', enabled: true }
        ]
      },
      help_menu=> {
        enabled: true,
        item_data: [
          { caption: '', enabled: true },
          { caption: 'Calculator Help', enabled: true }
        ]
      }
    }
    verify_ui_states(ui)
  end

  def choose_menu_item(menu, item, method = :mouse)
    menu_map = {
      calc:             calc_menu,
      calculator:       calc_menu,
      file:             file_menu,
      edit:             edit_menu,
      view:             view_menu,
      view_sub_menu:    view_sub_menu,
      convert:          convert_menu,
      convert_sub_menu: convert_sub_menu,
      window:           window_menu
    }
    menu_obj = menu_map[menu]
    raise "#{menu} is not a supported menu" if menu_obj.nil?
    menu_obj.choose_menu_item(item, method)
  end
end
