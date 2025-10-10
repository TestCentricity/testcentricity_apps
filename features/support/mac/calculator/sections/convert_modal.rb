class ConvertModal < TestCentricity::ScreenSection
  trait(:section_name)    { 'Convert Modal' }
  trait(:section_locator) { { xpath: '//XCUIElementTypeSheet' } }
  trait(:convert_items)   {
    ['Area',
     'Currency',
     'Energy or Work',
     'Length',
     'Power',
     'Pressure',
     'Speed',
     'Temperature',
     'Time',
     'Volume',
     'Weights and Masses']
  }
  trait(:area_items)      {
    ['Acres',
     'Ares',
     'Decares',
     'Hectares',
     'Square Centimeters',
     'Square Feet',
     'Square Inches',
     'Square Kilometers',
     'Square Meters',
     'Square Miles',
     'Square Millimeters',
     'Square Yards']
  }
  trait(:work_items)      {
    ['BTUs',
     'Calories',
     'Ergs',
     'Foot-Pounds',
     'Joules',
     'Kilogram-Calories',
     'Kilogram-Meters',
     'Kilowatt-Hours',
     'Newton-Meters']
  }
  trait(:length_items)    {
    ['Centimeters',
     'Feet',
     'Inches',
     'Kilometers',
     'Meters',
     'Miles',
     'Millimeters',
     'Nautical Miles',
     'Yards']
  }
  trait(:power_items)     {
    ['BTUs/Minute',
     'Foot-Pounds/Minute',
     'Foot-Pounds/Second',
     'Horsepower',
     'Kilowatts',
     'Watts']
  }
  trait(:pressure_items)  {
    ['Atmospheres',
     'Bars',
     'Inches of Mercury',
     'Millimeters of Mercury (Torr)',
     'Pascals',
     'Pounds/Square Foot',
     'Pounds/Square Inch']
  }
  trait(:speed_items)     {
    ['Feet/Minute',
     'Feet/Second',
     'Kilometers/Hour',
     'Kilometers/Minute',
     'Knots',
     'Meters/Second',
     'Miles/Hour',
     'Miles/Minute']
  }
  trait(:temp_items)      {
    ['Celsius',
     'Fahrenheit',
     'Kelvin']
  }
  trait(:time_items)      {
    ['Seconds',
     'Minutes',
     'Hours',
     'Days',
     'Weeks',
     'Years']
  }
  trait(:volume_items)    {
    ['Cubic Feet',
     'Cubic Meters',
     'Fluid Drams (US)',
     'Fluid Ounces (US)',
     'Gallons (US)',
     'Liters',
     'Pints (US)',
     'Quarts (US)']
  }
  trait(:weight_items)    {
    ['Drams',
     'Grams',
     'Kilograms',
     'Long Tons',
     'Ounces',
     'Pounds (US)',
     'Short Tons (US)',
     'Slugs',
     'Tonnes']
  }

  # Convert Modal UI elements
  selectlists convert_select: { predicate: 'identifier == "_NS:146"' },
              from_select:    { predicate: 'identifier == "_NS:68"' },
              to_select:      { predicate: 'identifier == "_NS:104"' }
  buttons     convert_button: { xpath: '//XCUIElementTypeButton[2]' },
              cancel_button:  { xpath: '//XCUIElementTypeButton[1]' }
  labels      convert_label:  { xpath: '//XCUIElementTypeStaticText[1]' },
              from_label:     { xpath: '//XCUIElementTypeStaticText[2]' },
              to_label:       { xpath: '//XCUIElementTypeStaticText[3]' }

  def verify_modal(mode)
    case mode
    when :area
      convert = 'Area'
      from = 'Acres'
      to = 'Ares'
      items = area_items
    when :energy_or_work
      convert = 'Energy or Work'
      from = 'BTUs'
      to = 'Calories'
      items = work_items
    when :length
      convert = 'Length'
      from = 'Centimeters'
      to = 'Feet'
      items = length_items
    when :power
      convert = 'Power'
      from = 'BTUs/Minute'
      to = 'Foot-Pounds/Minute'
      items = power_items
    when :pressure
      convert = 'Pressure'
      from = 'Atmospheres'
      to = 'Bars'
      items = pressure_items
    when :speed
      convert = 'Speed'
      from = 'Feet/Minute'
      to = 'Feet/Second'
      items = speed_items
    when :temperature
      convert = 'Temperature'
      from = 'Celsius'
      to = 'Fahrenheit'
      items = temp_items
    when :time
      convert = 'Time'
      from = 'Seconds'
      to = 'Minutes'
      items = time_items
    when :volume
      convert = 'Volume'
      from = 'Cubic Feet'
      to = 'Cubic Meters'
      items = volume_items
    when :weights_and_masses
      convert = 'Weights and Masses'
      from = 'Drams'
      to = 'Grams'
      items = weight_items
    else
      raise "#{mode} is not a valid conversion mode"
    end

    ui = {
      self => { visible: true},
      convert_label => {
        value: 'Convert:',
        enabled: true,
        visible: true
      },
      from_label => {
        value: 'From:',
        enabled: true,
        visible: true
      },
      to_label => {
        value: 'To:',
        enabled: true,
        visible: true
      },
      convert_select => {
        value: convert,
        enabled: true,
        visible: true,
        items: convert_items,
        itemcount: 11
      },
      from_select => {
        value: from,
        enabled: true,
        visible: true,
        items: items
      },
      to_select => {
        value: to,
        enabled: true,
        visible: true,
        items: items
      },
      convert_button => {
        caption: 'Convert',
        enabled: true,
        visible: true
      },
      cancel_button => {
        caption: 'Cancel',
        enabled: true,
        visible: true
      },
    }
    verify_ui_states(ui)
  end

  def dismiss
    cancel_button.click
    self.wait_until_gone(2)
  end

  def perform_conversion(from, to)
    from_select.choose_item(from)
    to_select.choose_item(to)
    convert_button.click
    self.wait_until_gone(2)
  end
end
