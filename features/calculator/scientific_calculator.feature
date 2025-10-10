@desktop @mac @regression @calculator


Feature:  Scientific Calculator View
  In order to ensure comprehensive support for various MacOS UI elements
  As a developer of the TestCentricity Apps gem
  I expect to interact with screen and menu elements of the MacOS Calculator app


  Background:
    Given I have launched the Calculator app
    And I have chosen the Scientific view


  Scenario:  Verify Scientific Calculator View
    Then I expect the Calculator screen to be correctly displayed

@bat
  Scenario Outline:  Verify calculations can be entered and yield expected result
    When I execute the following scientific calculation:
      |<calculation> |
    Then I expect the result to be <result>

    Examples:
      |calculation |result |
      |5 x3        |125    |
      |4 x2        |16     |
      |64 √x       |8      |
      |125 ∛x      |5      |
      |10 1/x      |0.1    |


  Scenario:  Window zoom switches to Basic mode
    When I zoom in the window
    Then I expect the Basic view to be displayed
