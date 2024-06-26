class AboutDialogScreen < TestCentricity::ScreenObject
  trait(:screen_name)     { 'About' }
  trait(:screen_locator)  { { predicate: 'identifier == "_NS:155"' } }

  # About Dialog UI elements
  image   :app_icon,        { predicate: 'label == "Calculator icon"' }
  buttons close_button:     { predicate: 'identifier == "_XCUI:CloseWindow"' },
          zoom_button:      { predicate: 'identifier == "_XCUI:ZoomWindow"' },
          minimize_button:  { predicate: 'identifier == "_XCUI:MinimizeWindow"' }
  labels  calculator_label: { predicate: 'identifier == "_NS:33"' },
          version_label:    { predicate: 'identifier == "_NS:51"' },
          copyright_label:  { predicate: 'identifier == "_NS:115"' }

  def verify_screen_ui
    ui = {
      app_icon => {
        enabled: true,
        visible: true
      },
      calculator_label => {
        value: 'Calculator',
        enabled: true,
        visible: true
      },
      version_label => {
        value: { starts_with: 'Version ' },
        enabled: true,
        visible: true
      },
      copyright_label => {
        value: { starts_with: 'Copyright ' },
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
        enabled: false,
        visible: true
      }
    }
    verify_ui_states(ui)
    dismiss
  end

  def dismiss
    close_button.click
    self.wait_until_gone(2)
  end
end
