class ShortcutDetailScreen < TestCentricity::ScreenObject
  trait(:screen_name)    { 'Shortcut Detail' }
  trait(:screen_locator) { { predicate: 'identifier == "editor.shortcutname"' } }

  # Shortcut Detail screen UI elements
  buttons close_button:    { predicate: 'identifier == "_XCUI:CloseWindow"' },
          zoom_button:     { predicate: 'identifier == "_XCUI:FullScreenWindow"' },
          minimize_button: { predicate: 'identifier == "_XCUI:MinimizeWindow"' }
  label   :window_title,   { predicate: 'identifier == "editor.shortcutname"' }

  def verify_detail_ui(shortcut_name)
    ui = {
      window_title => { value: shortcut_name },
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
      }
    }
    verify_ui_states(ui)
  end
end
