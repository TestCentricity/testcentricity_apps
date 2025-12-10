

Given(/^I have launched the Shortcuts app$/) do
  AppiumConnect.activate_app
  shortcuts_screen.verify_screen_exists
end


When(/^I (.*) on the (.*) item in the sidebar list$/) do |action, item_name|
  shortcuts_screen.perform_sidebar_action(action, item_name)
end


When(/^I (.*) on the (.*) shortcut in the Library table$/) do |action, shortcut_name|
  shortcuts_screen.perform_view_action(action, shortcut_name)
end


When(/^I choose the (.*) popup menu item for the (.*) shortcut in the Library table$/) do |menu_item, shortcut_name|
  shortcuts_screen.choose_popmenu_item(menu_item, shortcut_name)
end


Then(/^I expect all (.*) to be displayed in the Library table$/) do |item_name|
  shortcuts_screen.verify_library_table(item_name)
end


Then(/^I expect the (.*) detail window to be correctly displayed$/) do |shortcut_name|
  shortcut_detail_screen.verify_detail_ui(shortcut_name)
end


Then(/^I expect the (.*) popup menu to be correctly displayed$/) do |menu|
  menu = menu.downcase.to_sym unless menu.is_a?(Symbol)
  case menu
  when :shortcut
    shortcuts_screen.verify_shortcut_popup_menu
  when :sidebar
    shortcuts_screen.verify_sidebar_popup_menu
  else
    raise "#{menu} is not a recognized menu"
  end
end


Then(/^I expect the Gallery to be displayed$/) do
  shortcuts_screen.verify_gallery
end
