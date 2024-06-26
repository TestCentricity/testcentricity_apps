



When(/^I choose to convert (.*)$/) do |mode|
  calculator_screen.clear_convert_menu
  calculator_screen.invoke_convert_modal(mode)
end


When(/^I choose the (.*) view using the (.*)$/) do |view, method|
  calculator_screen.choose_view_mode(view, method.downcase.to_sym)
end


When(/^I (.*) the Calculator app using the (.*)$/) do |action, method|
  calculator_screen.perform_action(action, method.downcase.to_sym)
end


Then(/^I expect the Calculator app to be (.*)$/) do |state|
  expect(AppiumConnect.app_state).to eq(state.gsub(/\s+/, '_').downcase.to_sym)
end


When(/^I choose to show the About dialog$/) do
  calculator_screen.perform_action(:about)
end


When(/^I choose to show the Paper Tape using the (.*)$/) do |method|
  calculator_screen.perform_action(:paper_tape, method.downcase.to_sym)
end


When(/^I choose to (.*) the data using the (.*)$/) do |action, method|
  calculator_screen.perform_action(action, method.downcase.to_sym)
end


Then(/^I expect the menubar and its menus to be correct$/) do
  calculator_screen.verify_menubar
end


When(/^I choose to (?:enable|disable) (.*) using the (.*)$/) do |action, method|
  calculator_screen.perform_action(action, method.downcase.to_sym)
end


When(/^I choose to (.*) separators$/) do |action|
  calculator_screen.perform_action(action)
end
