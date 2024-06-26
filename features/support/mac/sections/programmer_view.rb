class ProgrammerView < TestCentricity::ScreenSection
  trait(:section_name)    { 'Programmer View section' }
  trait(:section_locator) { { predicate: 'identifier = "_NS:808"' } }
  trait(:prog_operators)  {
    {
      'and': and_button,
      'or':  or_button,
      'nor': nor_button,
      'xor': xor_button,
      '1':   one_button,
      '2':   two_button,
      '3':   three_button,
      '4':   four_button,
      '5':   five_button,
      '6':   six_button,
      '7':   seven_button,
      '8':   eight_button,
      '9':   nine_button,
      '0':   zero_button,
      'a':   a_button,
      'b':   b_button,
      'c':   c_button,
      'd':   d_button,
      'e':   e_button,
      'f':   f_button,
      'ff':  ff_button,
      '00':  zero_zero_button,
      '+':   add_button,
      '-':   subtract_button,
      'x':   multiply_button,
      '*':   multiply_button,
      '/':   divide_button,
      '÷':   divide_button,
      '=':   equals_button
    }
  }

  # Programmer View section UI elements
  radios  ascii_radio:       { predicate: 'label == "ASCII"' },
          unicode_radio:     { predicate: 'label == "Unicode"' },
          octal_radio:       { predicate: 'label == "8"' },
          decimal_radio:     { predicate: 'label == "10"' },
          hex_radio:         { predicate: 'label == "16"' }
  buttons binary_button:     { predicate: 'identifier == "_NS:866"' },
          and_button:        { predicate: 'label == "bitwise and"' },
          or_button:         { predicate: 'label == "bitwise or"' },
          nor_button:        { predicate: 'label == "bitwise nor"' },
          xor_button:        { predicate: 'label == "bitwise exclusive or"' },
          shift_lt_button:   { predicate: 'label == "shift left"' },
          shift_rt_button:   { predicate: 'label == "shift right"' },
          shift_lt_y_button: { predicate: 'label == "shift left y bits""' },
          shift_rt_y_button: { predicate: 'label == "shift right y bits"' },
          byte_flip_button:  { predicate: 'identifier == "_NS:1133"' },
          word_flip_button:  { predicate: 'identifier == "_NS:1173"' },
          ff_button:         { predicate: 'identifier == "_NS:1181"' },
          zero_zero_button:  { predicate: 'label == "0 0"' },
          zero_button:       { predicate: 'identifier == "_NS:1192"' },
          one_button:        { predicate: 'identifier == "_NS:1141"' },
          two_button:        { predicate: 'identifier == "_NS:1151"' },
          three_button:      { predicate: 'identifier == "_NS:1162"' },
          four_button:       { predicate: 'identifier == "_NS:1100"' },
          five_button:       { predicate: 'identifier == "_NS:1111"' },
          six_button:        { predicate: 'identifier == "_NS:1122"' },
          seven_button:      { predicate: 'identifier == "_NS:1019"' },
          eight_button:      { predicate: 'identifier == "_NS:1031"' },
          nine_button:       { predicate: 'identifier == "_NS:1041"' },
          a_button:          { predicate: 'identifier == "_NS:933"' },
          b_button:          { predicate: 'identifier == "_NS:945"' },
          c_button:          { predicate: 'identifier == "_NS:957"' },
          d_button:          { predicate: 'identifier == "_NS:897"' },
          e_button:          { predicate: 'identifier == "_NS:909"' },
          f_button:          { predicate: 'identifier == "_NS:921"' },
          ac_button:         { predicate: 'label == "clear all"' },
          clear_button:      { predicate: 'label == "clear"' },
          rol_button:        { predicate: 'label == "rotate left"' },
          ror_button:        { predicate: 'label == "rotate right"' },
          twos_button:       { predicate: 'label == "twos complement"' },
          ones_button:       { predicate: 'label == "ones complement"' },
          divide_button:     { predicate: 'label == "divide"' },
          subtract_button:   { predicate: 'label == "minus"' },
          multiply_button:   { predicate: 'label == "times"' },
          add_button:        { predicate: 'label == "plus"' },
          equals_button:     { predicate: 'label == "equals"' }
  section :bit_field, BitField

  attr_accessor :number_mode
  attr_accessor :char_mode
  attr_accessor :bits_mode

  def set_modes
    @number_mode = case
                   when hex_radio.selected?
                     :hexadecimal
                   when decimal_radio.selected?
                     :decimal
                   when octal_radio.selected?
                     :octal
                   end
    @char_mode = case
                 when ascii_radio.selected?
                   :ascii
                 when unicode_radio.selected?
                   :unicode
                 else
                   nil
                 end
    @bits_mode = bit_field.visible?
  end

  def verify_programmer_view
    ui = {
      binary_button => {
        caption: @bits_mode ? 'Hide Binary' : 'Show Binary',
        enabled: true,
        visible: true
      },
      zero_zero_button => {
        caption: '00',
        enabled: true,
        visible: true
      },
      zero_button => {
        caption: '0',
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
      seven_button => {
        caption: '7',
        enabled: true,
        visible: true
      },
      eight_button => {
        caption: '8',
        enabled: @number_mode == :hexadecimal || @number_mode == :decimal,
        visible: true
      },
      nine_button => {
        caption: '9',
        enabled: @number_mode == :hexadecimal || @number_mode == :decimal,
        visible: true
      },
      a_button => {
        caption: 'A',
        enabled: @number_mode == :hexadecimal,
        visible: true
      },
      b_button => {
        caption: 'B',
        enabled: @number_mode == :hexadecimal,
        visible: true
      },
      c_button => {
        caption: 'C',
        enabled: @number_mode == :hexadecimal,
        visible: true
      },
      d_button => {
        caption: 'D',
        enabled: @number_mode == :hexadecimal,
        visible: true
      },
      e_button => {
        caption: 'E',
        enabled: @number_mode == :hexadecimal,
        visible: true
      },
      f_button => {
        caption: 'F',
        enabled: @number_mode == :hexadecimal,
        visible: true
      },
      ff_button => {
        caption: 'FF',
        enabled: @number_mode == :hexadecimal,
        visible: true
      },
      subtract_button => {
        caption: '−',
        enabled: true,
        visible: true
      },
      divide_button => {
        caption: '÷',
        enabled: true,
        visible: true
      },
      multiply_button => {
        caption: '×',
        enabled: true,
        visible: true
      },
      add_button => {
        caption: '+',
        enabled: true,
        visible: true
      },
      equals_button => {
        caption: 'enter',
        enabled: true,
        visible: true
      }
    }
    verify_ui_states(ui)
    # verify bit field elements if visible
    # bit_field.verify_bit_field if @bits_mode

    bit_field.verify_bit_field
  end

  def choose_number_mode(mode)
    mode = mode.downcase.to_sym if mode.is_a? String
    return if @number_mode == mode
    case mode
    when :octal
      octal_radio.select
    when :decimal
      decimal_radio.select
    when :hex, :hexadecimal
      hex_radio.select
    else
      raise "#{mode} is not a valid selector"
    end
    @number_mode = mode
  end

  def choose_char_mode(mode)
    mode = mode.downcase.to_sym if mode.is_a? String
    return if @char_mode == mode
    case mode
    when :ascii
      ascii_radio.select
    when :unicode
      unicode_radio.select
    when :disabled
      ascii_radio.unselect
      unicode_radio.unselect
      mode = nil
    else
      raise "#{mode} is not a valid selector"
    end
    @char_mode = mode
  end

  def perform_calculation(calc, method)
    method = method.downcase.to_sym if method.is_a?(String)
    if method == :mouse
      if calc.is_a?(Array)
        calc.each do |op|
          button_obj = prog_operators[op.downcase.to_sym]
          if button_obj.nil?
            char_op(op)
          else
            button_obj.click
          end
        end
      else
        char_op(calc)
      end
    else
      self.send_keys(calc)
    end
  end

  def char_op(calc)
    calc.each_char do |op|
      button_obj = prog_operators[op.downcase.to_sym]
      raise "#{op} is not a valid operator" if button_obj.nil?
      button_obj.click
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

  def verify_binary_data(bit_data)
    bit_field.verify_bits(bit_data)
  end

  def set_bits(bit_data)
    clear_result
    bit_field.set_bits(bit_data)
  end
end
