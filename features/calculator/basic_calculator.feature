@desktop @mac @regression @calculator


Feature:  Basic Calculator View
  In order to ensure comprehensive support for various MacOS UI elements
  As a developer of the TestCentricity Apps gem
  I expect to interact with screen and menu elements of the MacOS Calculator app


  Background:
    Given I have launched the Calculator app
    And I have chosen the Basic view


  Scenario:  Verify Basic Calculator View
    Then I expect the Calculator screen to be correctly displayed

@bat
  Scenario Outline:  Verify calculations can be entered using keyboard or mouse
    When I execute the following calculation using the specified input method:
      |<calculation> |<method> |
    Then I expect the result to be <result>

    Examples:
      |calculation    |result  |method   |
      |4 + 3 - 2      |5       |keyboard |
      |98.7 * 6.5 / 2 |320.775 |keyboard |
      |360 * 25%      |90      |keyboard |
      |4 + 3 - 2      |5       |mouse    |
      |98.7 * 6.5 / 2 |320.775 |mouse    |
      |360 * 25%      |90      |mouse    |
      |25.3± + 6.3    |-19     |mouse    |


  Scenario:  Verify result can be cleared
    Given I enter 1234567 using the keyboard
    When I clear all entries
    Then I expect the result to be 0


  Scenario Outline:  Verify conversion modes and selectors
    When I choose to convert <mode>
    Then I expect the <mode> conversion modal to be correctly displayed

    Examples:
      |mode               |
      |Area               |
      |Energy or Work     |
      |Length             |
      |Power              |
      |Pressure           |
      |Speed              |
      |Temperature        |
      |Time               |
      |Volume             |
      |Weights and Masses |


  Scenario Outline:  Verify conversions yield expected results
    Given I enter <value> using the keyboard
    When I convert <mode> from <from> to <to>
    Then I expect the result to be <result>

    Examples:
      |value |mode               |from              |to             |result     |
      |1.25  |Energy or Work     |Kilowatt-Hours    |Joules         |4500000    |
      |300   |Area               |Hectares          |Acres          |741.316143 |
      |2500  |Length             |Feet              |Meters         |762        |
      |12.5  |Power              |Kilowatts         |Watts          |12500      |
      |28.75 |Pressure           |Inches of Mercury |Pascals        |97347.5    |
      |60    |Speed              |Miles/Hour        |Kilometers/Hour|96.56064   |
      |6.8   |Temperature        |Fahrenheit        |Celsius        |-14        |
      |4     |Time               |Hours             |Seconds        |14400      |
      |2     |Volume             |Cubic Meters      |Liters         |2000       |
      |100   |Weights and Masses |Grams             |Ounces         |3.52739619 |


  Scenario:  Window zoom switches to Scientific mode
    When I zoom out the window
    Then I expect the Scientific view to be displayed
