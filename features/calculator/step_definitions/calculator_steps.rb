

Given(/^I have launched the Calculator app$/) do
  AppiumConnect.activate_app
  calculator_screen.verify_screen_exists
end


When(/^I execute the following calculation using the specified input method:$/) do |table|
  table.raw.each do |row|
    calculator_screen.perform_calculation(row[0], row[1].downcase.to_sym)
  end
end


When(/^I execute the following scientific calculation:$/) do |table|
  table.raw.each do |row|
    calculator_screen.perform_scientific_calculation(row[0])
  end
end


Then(/^I expect the result to be (.*)$/) do |value|
  calculator_screen.verify_result(value)
end


When(/^I enter (.*) using the (.*)$/) do |data, method|
  calculator_screen.perform_calculation(data.to_s, method)
end


When(/^I clear all entries$/) do
  calculator_screen.clear_result
end


When(/^I have chosen the (.*) view$/) do |view|
  calculator_screen.choose_view_mode(view)
end


When(/^I zoom (?:out|in) the window$/) do
  calculator_screen.window_zoom
end


Then(/^I expect the (.*) view to be displayed$/) do |view|
  calculator_screen.verify_view_mode(view)
end


Then(/^I expect the (.*) conversion modal to be correctly displayed$/) do |mode|
  calculator_screen.verify_convert_modal(mode)
end


When(/^I convert (.*) from (.*) to (.*)$/) do |mode, from, to|
  calculator_screen.perform_conversion(mode, from, to)
end


Then(/^RPN mode should( not)? be displayed$/) do |negate|
  calculator_screen.verify_rpn_mode(visible = !negate)
end
