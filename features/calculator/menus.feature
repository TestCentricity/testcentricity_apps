@desktop @mac @regression @calculator


Feature:  Calculator Menus
  In order to ensure comprehensive support for various MacOS UI elements
  As a developer of the TestCentricity Apps gem
  I expect to interact with menu elements of the MacOS Calculator app


  Background:
    Given I have launched the Calculator app


  Scenario Outline:  Verify view can be changed using menu keyboard shortcuts
    When I choose the <view> view using the keyboard
    Then I expect the <view> view to be displayed
    And I expect the menubar and its menus to be correct

    Examples:
      |view       |
      |Scientific |
      |Basic      |
      |Programmer |


  Scenario Outline:  Verify view can be changed via menus using the mouse
    When I choose the <view> view using the mouse
    Then I expect the <view> view to be displayed

    Examples:
      |view       |
      |Scientific |
      |Programmer |
      |Basic      |


  Scenario Outline:  Verify view can be changed via menus using the mouse and keyboard shortcuts
    Given I have chosen the <view> view
    When I choose to enable RPN mode using the <method>
    Then RPN mode should be displayed
    When I choose to disable RPN mode using the <method>
    Then RPN mode should not be displayed

    Examples:
      |view       |method |
      |Scientific |keys   |
      |Programmer |mouse  |
      |Basic      |keys   |


  Scenario Outline:  Verify entered data can be copied and pasted via menus
    Given I enter 1234567 using the keyboard
    And I choose to copy the data using the <method>
    And I clear all entries
    When I choose to paste the data using the <method>
    Then I expect the result to be 1234567

    Examples:
      |method |
      |mouse  |
      |keys   |


  Scenario Outline:  Verify app can be hidden or terminated via menus using the mouse and keyboard shortcuts
    When I <action> the Calculator app using the <method>
    Then I expect the Calculator app to be <state>

    Examples:
      |action |method |state                 |
      |close  |mouse  |not running           |
      |close  |keys   |not running           |
      |close  |button |not running           |
      |hide   |mouse  |running in background |
      |hide   |keys   |running in background |
      |quit   |mouse  |not running           |
      |quit   |keys   |not running           |


  Scenario: Verify About dialog can be invoked via menu
    When I choose to show the About dialog
    Then I expect the About screen to be correctly displayed


  Scenario Outline: Verify Paper Tape dialog can be invoked via menu
    Given I have chosen the Basic view
    When I choose to show the Paper Tape using the <method>
    Then I expect the Paper Tape screen to be correctly displayed

    Examples:
      |method |
      |mouse  |
      |keys   |


  Scenario:  Verify that thousands separators can be shown or hidden via menu
    Given I have chosen the Basic view
    And I enter 123456789 using the keyboard
    When I choose to show thousands separators
    Then I expect the result to be 123,456,789
    When I choose to hide thousands separators
    Then I expect the result to be 123456789
