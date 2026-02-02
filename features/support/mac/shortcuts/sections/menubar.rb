class ShortcutsMenuBar < TestCentricity::MenuBar
  # Menu Bar UI elements
  menus shortcuts_menu: { class_chain: '**/XCUIElementTypeMenuBarItem[2]' },
        file_menu:      { class_chain: '**/XCUIElementTypeMenuBarItem[3]' },
        edit_menu:      { class_chain: '**/XCUIElementTypeMenuBarItem[4]' },
        view_menu:      { class_chain: '**/XCUIElementTypeMenuBarItem[5]' },
        shortcut_menu:  { class_chain: '**/XCUIElementTypeMenuBarItem[6]' },
        window_menu:    { class_chain: '**/XCUIElementTypeMenuBarItem[7]' },
        help_menu:      { class_chain: '**/XCUIElementTypeMenuBarItem[8]' }

  def verify_menu_bar
    ui = {
      self => {
        enabled: true,
        # items: %w[Apple Shortcuts File Edit View Shortcut Window Help],
        # itemcount: 8
      },
      shortcuts_menu => {
        enabled: true,
        itemcount: 21,
        item_data: [
          { caption: 'About Shortcuts', enabled: true },
          { caption: '', enabled: false },
          { caption: 'Settings…', enabled: true },
          { caption: '', enabled: false },
          { caption: 'Services', enabled: true },
          { caption: '', enabled: false },
          { caption: 'Hide Shortcuts', enabled: true },
          { caption: 'Hide Others', enabled: true },
          { caption: 'Show All', enabled: false },
          { caption: '', enabled: false },
          { caption: 'Quit Shortcuts', enabled: true },
          { caption: 'Quit and Keep Windows', enabled: true },
          { caption: 'Activity Monitor', enabled: true },
          { caption: 'Allocations & Leaks', enabled: true },
          { caption: 'File Activity', enabled: true },
          { caption: 'System Trace', enabled: true },
          { caption: 'Time Profile Active Application', enabled: true },
          { caption: 'Time Profile App Under Mouse', enabled: true },
          { caption: 'Time Profile Entire System', enabled: true },
          { caption: 'Toggle Instruments Recording', enabled: true },
          { caption: 'Services Settings…', enabled: true }
        ]
      },
      file_menu => {
        enabled: true,
        item_data: [
          { caption: 'New Shortcut', enabled: true },
          { caption: 'New Folder', enabled: true },
          { caption: 'Open', enabled: false },
          { caption: 'Open Recent', enabled: true },
          { caption: '', enabled: false },
          { caption: 'Close', enabled: true },
          { caption: 'Close All', enabled: true },
          { caption: 'Rename…', enabled: false },
          { caption: '', enabled: false },
          { caption: 'Import…', enabled: true },
          { caption: 'Export…', enabled: false },
          { caption: 'Share', enabled: true },
          { caption: 'Add to Dock', enabled: false },
          { caption: 'Music Quiz', enabled: true },
          { caption: 'Text Last Image', enabled: true },
          { caption: '', enabled: false },
          { caption: 'Clear Recents', enabled: true },
          { caption: 'No Shortcut Selected', enabled: false }
        ]
      },
      edit_menu => {
        enabled: true,
        item_data: [
          { caption: 'Undo', enabled: false },
          { caption: 'Redo', enabled: false },
          { caption: '', enabled: false },
          { caption: 'Cut', enabled: false },
          { caption: 'Copy', enabled: false },
          { caption: 'Paste', enabled: true },
          { caption: 'Duplicate', enabled: false },
          { caption: 'Duplicate Action', enabled: false },
          { caption: 'Delete', enabled: false },
          { caption: 'Select All', enabled: true },
          { caption: '', enabled: false },
          { caption: 'Find', enabled: true },
          { caption: '', enabled: false },
          { caption: 'Move Up', enabled: false },
          { caption: 'Move Down', enabled: false },
          { caption: '', enabled: false },
          { caption: 'Control Flow', enabled: true },
          { caption: 'Comment', enabled: false },
          { caption: 'Set Variable', enabled: false },
          { caption: 'Ask for Input', enabled: false },
          { caption: 'Show Result', enabled: false },
          { caption: '', enabled: false },
          { caption: 'Start Dictation…', enabled: true },
          { caption: 'Emoji & Symbols', enabled: true },
          { caption: 'Choose From Menu', enabled: false },
          { caption: 'If', enabled: false },
          { caption: 'Repeat', enabled: false },
          { caption: 'Repeat with Each', enabled: false }
        ]
      },
      view_menu => {
        enabled: true,
        item_data: [
          { caption: 'Show Action Library', enabled: false },
          { caption: 'Show Shortcut Details', enabled: false },
          { caption: '', enabled: false },
          { caption: 'Enter Full Screen', enabled: true }
        ]
      },
      shortcut_menu => {
        enabled: true,
        item_data: [
          { caption: 'Run', enabled: false },
          { caption: 'Stop', enabled: false }
        ]
      },
      help_menu => {
        enabled: true,
        item_data: [
          { caption: 'Shortcuts Help', enabled: true },
          { caption: '', enabled: false },
          { caption: 'Report a Concern', enabled: false },
          { caption: 'About Shortcuts Sharing & Privacy…', enabled: true }
        ]
      }
    }
    verify_ui_states(ui)
  end

  def choose_menu_item(menu, item, method = :mouse)
    menu_map = {
      shortcuts: shortcuts_menu,
      file:      file_menu,
      edit:      edit_menu,
      view:      view_menu,
      shortcut:  shortcut_menu,
      window:    window_menu,
      help:      help_menu
    }
    menu_obj = menu_map[menu]
    raise "#{menu} is not a supported menu" if menu_obj.nil?

    menu_obj.choose_menu_item(item, method)
  end
end
