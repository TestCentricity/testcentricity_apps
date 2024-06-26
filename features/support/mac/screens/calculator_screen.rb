class CalculatorAppScreen < TestCentricity::ScreenObject
  trait(:screen_name)    { 'Calculator' }
  trait(:screen_locator) { { predicate: 'identifier == "_NS:436"' } }

  # Calculator screen UI elements
  labels   result_display:   { predicate: 'label == "main display"' },
           input_mode:       { predicate: 'label == "input mode"' }
  buttons  close_button:     { predicate: 'identifier == "_XCUI:CloseWindow"' },
           zoom_button:      { predicate: 'identifier == "_XCUI:ZoomWindow"' },
           minimize_button:  { predicate: 'identifier == "_XCUI:MinimizeWindow"' },
           ex_regs_button:   { predicate: 'label == "exchange registers"' },
           roll_down_button: { predicate: 'label == "roll down"' },
           roll_up_button:   { predicate: 'label == "roll up"' },
           drop_button:      { predicate: 'label == "drop"' }
  menubar  :calc_menu_bar,  CalculatorMenuBar
  sections basic_view:      BasicView,
           scientific_view: ScientificView,
           programmer_view: ProgrammerView,
           rpn_view:        RPNView,
           convert_modal:   ConvertModal

  attr_accessor :view_mode
  attr_accessor :rpn_mode
  attr_accessor :entered_calc

  def verify_screen_exists
    super
    @view_mode = case
                 when scientific_view.visible?
                   :scientific
                 when programmer_view.visible?
                   :programmer
                 else
                   :basic
                 end
    @rpn_mode = rpn_view.visible?
    programmer_view.set_modes if @view_mode == :programmer
  end

  def verify_screen_ui
    ui = {
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
    # verify result is displayed
    verify_result('0')
    # verify presence of Basic view if in basic or scientific mode
    basic_view.verify_basic_view if [:basic, :scientific].include?(@view_mode)
    # verify presence of Scientific view if in scientific mode
    scientific_view.verify_scientific_view if @view_mode == :scientific
    # verify presence of Programmer view if in programmer mode
    programmer_view.verify_programmer_view if @view_mode == :programmer
  end

  def clear_result
    view = if @view_mode == :programmer
             programmer_view
           else
             basic_view
           end
    view.clear_result
  end

  def perform_calculation(calc, method)
    calc.gsub!(' ', '')
    view = if @view_mode == :programmer
             programmer_view
           else
             basic_view
           end
    view.perform_calculation(calc, method)
    view.execute_calc(method)
    @entered_calc = calc
  end

  def perform_scientific_calculation(calc)
    clear_result
    op_array = calc.split
    op_array.each do |op|
      next if scientific_view.perform_calculation(op.to_sym)
      op.each_char do |char|
        basic_view.perform_calculation(char, method = :keys)
      end
    end
    basic_view.execute_calc(method = :keys)
  end

  def perform_programmer_calculation(calc)
    clear_result
    op_array = calc.split
    programmer_view.perform_calculation(calc = op_array, method = :mouse)
    programmer_view.execute_calc(method = :keys)
  end

  def verify_result(value)
    value = "0x#{value}" if @view_mode == :programmer && programmer_view.number_mode == :hexadecimal
    ui = {
      result_display => {
        value: value,
        enabled: true,
        visible: true
      }
    }
    verify_ui_states(ui)
  end

  def choose_view_mode(mode, method = :keys)
    # if RPN mode is active, deactivate it
    calc_menu_bar.choose_menu_item(:view, 7, :keys) if @rpn_mode
    # choose specified view mode
    mode = mode.downcase.to_sym if mode.is_a? String
    menu_item = case mode
                when :basic
                  1
                when :scientific
                  2
                when :programmer
                  3
                else
                  raise "#{mode} is not a valid view mode"
                end
    return if @view_mode == mode
    calc_menu_bar.choose_menu_item(menu = :view, item = menu_item, method)
    @view_mode = mode
  end

  def perform_action(action, method = :mouse)
    action = action.gsub(/\s+/, '_').downcase.to_sym if action.is_a? String
    case action
    when :about
      calc_menu_bar.choose_menu_item(menu = :calculator, item = 1, method)
    when :paper_tape
      calc_menu_bar.choose_menu_item(menu = :window, item = 'Show Paper Tape', method)
    when :close
      if method == :button
        close_button.click
      else
        calc_menu_bar.choose_menu_item(menu = :file, item = 1, method)
      end
    when :quit
      calc_menu_bar.choose_menu_item(menu = :calculator, item = 7, method)
    when :hide
      if method == :button
        minimize_button.click
      else
        calc_menu_bar.choose_menu_item(menu = :calculator, item = 3, method)
      end
    when :copy
      calc_menu_bar.choose_menu_item(menu = :edit, item = 5, method)
    when :paste
      calc_menu_bar.choose_menu_item(menu = :edit, item = 6, method)
    when :rpn_mode
      calc_menu_bar.choose_menu_item(menu = :view, item = 7, method)
    when :show_thousands, :hide_thousands
      calc_menu_bar.choose_menu_item(menu = :view, item = 5, method)
    else
      raise "#{action} is not a valid selector"
    end
  end

  def window_zoom
    zoom_button.click
  end

  def verify_view_mode(mode)
    mode = mode.downcase.to_sym
    ui = {
      basic_view => { visible: [:basic, :scientific].include?(mode) },
      scientific_view => { visible: mode == :scientific },
      programmer_view => { visible: mode == :programmer }
    }
    verify_ui_states(ui)
    @view_mode = mode
  end

  def verify_rpn_mode(visible)
    ui = if visible
           {
             ex_regs_button => {
               caption: 'x↔y',
               enabled: true,
               visible: true
             },
             roll_down_button => {
               caption: 'R↓',
               enabled: true,
               visible: true
             },
             roll_up_button => {
               caption: 'R↑',
               enabled: true,
               visible: true
             },
             drop_button => {
               caption: 'drop',
               enabled: true,
               visible: true
             },
             rpn_view => { visible: true }
           }
         else
           {
             ex_regs_button => { visible: false },
             roll_down_button => { visible: false },
             roll_up_button => { visible: false },
             drop_button => { visible: false },
             rpn_view => { visible: false }
           }
         end
    verify_ui_states(ui)
    @rpn_mode = visible

    basic_view.verify_rpn_mode(visible) if [:basic, :scientific].include?(@view_mode)
  end

  def clear_convert_menu
    calc_menu_bar.choose_menu_item(menu = :convert, item = 1)
    calc_menu_bar.choose_menu_item(menu = :convert_sub_menu, item = :last)
  end

  def verify_menubar
    clear_convert_menu
    calc_menu_bar.verify_menu_bar(@view_mode)
  end

  def invoke_convert_modal(mode)
    conversion_modes = {
      area: 3,
      energy_or_work: 5,
      length: 6,
      power: 7,
      pressure: 8,
      speed: 9,
      temperature: 10,
      time: 11,
      volume: 12,
      weights_and_masses: 13
    }
    menu_item = conversion_modes[mode.gsub(/\s+/, '_').downcase.to_sym]
    raise "#{mode} is not a valid conversion mode" if menu_item.nil?
    calc_menu_bar.choose_menu_item(menu = :convert, item = menu_item)
  end

  def verify_convert_modal(mode)
    convert_modal.verify_modal(mode.gsub(/\s+/, '_').downcase.to_sym)
  end

  def perform_conversion(mode, from, to)
    invoke_convert_modal(mode)
    convert_modal.perform_conversion(from, to)
  end

  def verify_character(result)
    @entered_calc = "0x#{@entered_calc}" if programmer_view.number_mode == :hexadecimal
    ui = {
      input_mode => {
        visible: true,
        value: result
      },
      result_display=> {
        visible: true,
        value: @entered_calc
      }
    }
    verify_ui_states(ui)
  end

  def verify_binary_data
    programmer_view.verify_binary_data(@entered_calc)
  end
end
