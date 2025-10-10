@desktop @mac @regression @shortcuts


Feature:  Shortcuts App
  In order to ensure comprehensive support for various MacOS UI elements
  As a developer of the TestCentricity Apps gem
  I expect to interact with UI elements of the MacOS Shortcuts app


  Background:
    Given I have launched the Shortcuts app


  Scenario:  Verify Shortcuts main screen is correctly displayed
    Then I expect the Shortcuts screen to be correctly displayed
    And I expect the menubar and its menus to be correct


  Scenario:  Verify Gallery screen is correctly displayed when clicking Gallery item in sidebar
    When I click on the Gallery item in the sidebar list
    Then I expect the Gallery to be displayed


  Scenario:  Verify Starter Shortcuts are displayed after clicking on corresponding item in sidebar
    When I click on the Starter Shortcuts item in the sidebar list
    Then I expect all Starter Shortcuts to be displayed in the Library table


  Scenario:  Verify sidebar popup menu when right clicking on row item in sidebar table
    When I right click on the Starter Shortcuts item in the sidebar list
    Then I expect the sidebar popup menu to be correctly displayed


  Scenario:  Verify shortcut detail window appears when double clicking on shortcut in table
    When I double click on the Text Last Image shortcut in the Library table
    Then I expect the Text Last Image detail window to be correctly displayed


  Scenario:  Verify shortcut popup menu when right clicking on shortcut in table
    When I right click on the Music Quiz shortcut in the Library table
    Then I expect the shortcut popup menu to be correctly displayed


  Scenario:  Verify shortcut detail window appears when choosing Edit menu item in shortcut popup menu
    When I choose the Edit popup menu item for the Music Quiz shortcut in the Library table
    Then I expect the Music Quiz detail window to be correctly displayed
