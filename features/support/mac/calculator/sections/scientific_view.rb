class ScientificView < TestCentricity::ScreenSection
  trait(:section_name)    { 'Scientific View section' }
  trait(:section_locator) { { predicate: 'identifier == "_NS:8"' } }
  trait(:scientific_ops)  {
    {
      'π':   pi_button,
      'x2':  x_squared_button,
      'x3':  x_cubed_button,
      '√x':  square_root_button,
      '∛x':  cube_root_button,
      '1/x': inverse_button
    }
  }

  # Scientific View section UI elements
  buttons left_paren_button:  { predicate: 'label == "left paren"' },
          right_paren_button: { predicate: 'label == "right paren"' },
          mem_clear_button:   { predicate: 'label == "memory clear"' },
          mem_plus_button:    { predicate: 'label == "memory plus"' },
          mem_minus_button:   { predicate: 'label == "memory minus"' },
          mem_recall_button:  { predicate: 'label == "memory recall"' },
          sec_functs_button:  { predicate: 'label == "secondary functions"' },
          x_squared_button:   { predicate: 'label == "x squared"' },
          x_cubed_button:     { predicate: 'label == "x cubed"' },
          x_power_y_button:   { predicate: 'label == "x to the power of y"' },
          e_to_x_button:      { predicate: 'label == "e to the x"' },
          ten_to_x_button:    { predicate: 'label == "10 to the x"' },
          inverse_button:     { predicate: 'label == "inverse"' },
          square_root_button: { predicate: 'label == "square root"' },
          cube_root_button:   { predicate: 'label == "cube root"' },
          y_root_x_button:    { predicate: 'label == "y root of x"' },
          nat_log_button:     { predicate: 'label == "natural logarithm"' },
          log_base_10_button: { predicate: 'label == "logarithm base 10"' },
          x_factorial_button: { predicate: 'label == "x factorial"' },
          sine_button:        { predicate: 'label == "sine"' },
          cosine_button:      { predicate: 'label == "cosine"' },
          tangent_button:     { predicate: 'label == "tangent"' },
          e_button:           { predicate: 'label == "e"' },
          ee_button:          { predicate: 'label == "EE"' },
          radians_button:     { predicate: 'label == "radians"' },
          hyp_sine_button:    { predicate: 'label == "hyperbolic sine"' },
          hyp_cosine_button:  { predicate: 'label == "hyperbolic cosine"' },
          hyp_tangent_button: { predicate: 'label == "hyperbolic tangent"' },
          pi_button:          { predicate: 'label == "pi"' },
          rand_button:        { predicate: 'label == "random number"' }

  def verify_scientific_view
    ui = {
      left_paren_button => {
        caption: '(',
        enabled: true,
        visible: true
      },
      right_paren_button => {
        caption: ')',
        enabled: true,
        visible: true
      },
      mem_clear_button => {
        caption: 'mc',
        enabled: true,
        visible: true
      },
      mem_plus_button => {
        caption: 'm+',
        enabled: true,
        visible: true
      },
      mem_minus_button => {
        caption: 'm-',
        enabled: true,
        visible: true
      },
      mem_recall_button => {
        caption: 'mr',
        enabled: true,
        visible: true
      },
      sec_functs_button => {
        caption: '2nd',
        enabled: true,
        visible: true
      },
      x_squared_button => {
        caption: 'x2',
        enabled: true,
        visible: true
      },
      x_cubed_button => {
        caption: 'x3',
        enabled: true,
        visible: true
      },
      x_power_y_button => {
        caption: 'xy',
        enabled: true,
        visible: true
      },
      e_to_x_button => {
        caption: 'e to the x',
        enabled: true,
        visible: true
      },
      ten_to_x_button => {
        caption: '10 to the x',
        enabled: true,
        visible: true
      },
      inverse_button => {
        caption: '1/x',
        enabled: true,
        visible: true
      },
      square_root_button => {
        caption: '√x',
        enabled: true,
        visible: true
      },
      cube_root_button => {
        caption: '∛x',
        enabled: true,
        visible: true
      },
      y_root_x_button => {
        caption: 'y root of x',
        enabled: true,
        visible: true
      },
      nat_log_button => {
        caption: 'natural logarithm',
        enabled: true,
        visible: true
      },
      log_base_10_button => {
        caption: 'logarithm base 10',
        enabled: true,
        visible: true
      },
      x_factorial_button => {
        caption: 'x!',
        enabled: true,
        visible: true
      },
      sine_button => {
        caption: 'sine',
        enabled: true,
        visible: true
      },
      cosine_button => {
        caption: 'cosine',
        enabled: true,
        visible: true
      },
      tangent_button => {
        caption: 'tangent',
        enabled: true,
        visible: true
      },
      e_button => {
        caption: 'e',
        enabled: true,
        visible: true
      },
      ee_button => {
        caption: 'EE',
        enabled: true,
        visible: true
      },
      radians_button => {
        caption: 'Rad',
        enabled: true,
        visible: true
      },
      hyp_sine_button => {
        caption: 'hyperbolic sine',
        enabled: true,
        visible: true
      },
      hyp_cosine_button => {
        caption: 'hyperbolic cosine',
        enabled: true,
        visible: true
      },
      hyp_tangent_button => {
        caption: 'hyperbolic tangent',
        enabled: true,
        visible: true
      },
      pi_button => {
        caption: 'π',
        enabled: true,
        visible: true
      },
      rand_button => {
        caption: 'Rand',
        enabled: true,
        visible: true
      }
    }
    verify_ui_states(ui)
  end

  def perform_calculation(op)
    button_obj = scientific_ops[op]
    return false if button_obj.nil?
    button_obj.click
    true
  end
end
