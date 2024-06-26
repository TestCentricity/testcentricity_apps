

Given(/^I (?:choose|have chosen) the (.*) number mode$/) do |number_mode|
  calculator_screen.programmer_view.choose_number_mode(number_mode)
end


Given(/^I (?:choose|have chosen) the (.*) character mode$/) do |char_mode|
  calculator_screen.programmer_view.choose_char_mode(char_mode)
end


Then(/^I expect the result character to be (.*)$/) do |result|
  calculator_screen.verify_character(result)
end


When(/^I execute the following programmer calculation:$/) do |table|
  table.raw.each do |row|
    calculator_screen.perform_programmer_calculation(row[0])
  end
end


Then(/^I expect the bitfield to display the correct binary value$/) do
  calculator_screen.verify_binary_data
end


When(/^I set the bitfield to (.*)$/) do |value|
  calculator_screen.programmer_view.set_bits(value)
end
