class BasicView < TestCentricity::ScreenSection
  trait(:section_name)    { 'Basic View section' }
  trait(:section_locator) { { predicate: 'identifier == "_NS:262"' } }
  trait(:basic_operators) {
    {
      '1': one_button,
      '2': two_button,
      '3': three_button,
      '4': four_button,
      '5': five_button,
      '6': six_button,
      '7': seven_button,
      '8': eight_button,
      '9': nine_button,
      '0': zero_button,
      '+': add_button,
      '-': subtract_button,
      'x': multiply_button,
      '*': multiply_button,
      '±': negate_button,
      '/': divide_button,
      '÷': divide_button,
      '%': percent_button,
      '=': equals_button,
      '.': point_button
    }
  }

  # Basic View section UI elements
  buttons clear_button:    { predicate: 'identifier="_NS:407"' },
          negate_button:   { predicate: 'identifier="_NS:383"' },
          percent_button:  { predicate: 'identifier="_NS:427"' },
          divide_button:   { predicate: 'label == "divide"' },
          seven_button:    { predicate: 'label == "seven"' },
          eight_button:    { predicate: 'label == "eight"' },
          nine_button:     { predicate: 'label == "nine"' },
          multiply_button: { predicate: 'label == "multiply"' },
          four_button:     { predicate: 'label == "four"' },
          five_button:     { predicate: 'label == "five"' },
          six_button:      { predicate: 'label == "six"' },
          subtract_button: { predicate: 'label == "subtract"' },
          one_button:      { predicate: 'label == "one"' },
          two_button:      { predicate: 'label == "two"' },
          three_button:    { predicate: 'label == "three"' },
          add_button:      { predicate: 'label == "add"' },
          zero_button:     { predicate: 'label == "zero"' },
          point_button:    { predicate: 'identifier="_NS:349"' },
          equals_button:   { predicate: 'identifier="_NS:276"' }

  def verify_basic_view
    ui = {
      clear_button => {
        caption: 'all clear',
        enabled: true,
        visible: true
      },
      negate_button => {
        caption: '+/−',
        enabled: true,
        visible: true
      },
      percent_button => {
        caption: '%',
        enabled: true,
        visible: true
      },
      divide_button => {
        caption: '÷',
        enabled: true,
        visible: true
      },
      seven_button => {
        caption: '7',
        enabled: true,
        visible: true
      },
      eight_button => {
        caption: '8',
        enabled: true,
        visible: true
      },
      nine_button => {
        caption: '9',
        enabled: true,
        visible: true
      },
      multiply_button => {
        caption: '×',
        enabled: true,
        visible: true
      },
      four_button => {
        caption: '4',
        enabled: true,
        visible: true
      },
      five_button => {
        caption: '5',
        enabled: true,
        visible: true
      },
      six_button => {
        caption: '6',
        enabled: true,
        visible: true
      },
      subtract_button => {
        caption: '−',
        enabled: true,
        visible: true
      },
      one_button => {
        caption: '1',
        enabled: true,
        visible: true
      },
      two_button => {
        caption: '2',
        enabled: true,
        visible: true
      },
      three_button => {
        caption: '3',
        enabled: true,
        visible: true
      },
      add_button => {
        caption: '+',
        enabled: true,
        visible: true
      },
      zero_button => {
        caption: '0',
        enabled: true,
        visible: true
      },
      point_button => {
        caption: '.',
        enabled: true,
        visible: true
      },
      equals_button => {
        caption: '=',
        enabled: true,
        visible: true
      }
    }
    verify_ui_states(ui)
  end

  def verify_rpn_mode(visible)
    ui = {
      equals_button => {
        caption: visible ? 'enter' : '=',
        enabled: true,
        visible: true
      }
    }
    verify_ui_states(ui)
  end

  def perform_calculation(calc, method)
    if method.downcase.to_sym == :mouse
      calc.each_char do |op|
        button_obj = basic_operators[op.to_sym]
        raise "#{op} is not a valid operator" if button_obj.nil?
        button_obj.click
      end
    else
      self.send_keys(calc)
    end
  end

  def execute_calc(method)
    method = method.downcase.to_sym if method.is_a?(String)
    if method == :mouse
      equals_button.click
    else
      self.send_keys('=')
    end
  end

  def clear_result
    clear_button.click
  end
end
