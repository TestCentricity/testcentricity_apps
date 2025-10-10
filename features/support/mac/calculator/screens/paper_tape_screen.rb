class PaperTapeScreen < TestCentricity::ScreenObject
  trait(:screen_name)     { 'Paper Tape' }
  trait(:screen_locator)  { { predicate: 'identifier == "_NS:735"' } }

  # Paper Tape screen UI elements
  buttons   clear_button:    { predicate: 'identifier == "_NS:745"' },
            close_button:    { predicate: 'identifier == "_XCUI:CloseWindow"' },
            zoom_button:     { predicate: 'identifier == "_XCUI:ZoomWindow"' },
            minimize_button: { predicate: 'identifier == "_XCUI:MinimizeWindow"' }
  label     :title_label,    { xpath: '//XCUIElementTypeStaticText[1]' }
  textfield :tape_field,     { xpath: '//XCUIElementTypeTextView' }

  def verify_screen_ui
    self.wait_until_exists(5)
    ui = {
      title_label => {
        value: 'Paper Tape',
        enabled: true,
        visible: true
      },
      tape_field => {
        enabled: false,
        visible: true
      },
      clear_button => {
        caption: 'Clear',
        enabled: true,
        visible: true
      },
      close_button => {
        enabled: true,
        visible: true
      },
      zoom_button => {
        enabled: false,
        visible: true
      },
      minimize_button => {
        enabled: true,
        visible: true
      }
    }
    verify_ui_states(ui)
    dismiss
  end

  def dismiss
    close_button.click
  end
end
