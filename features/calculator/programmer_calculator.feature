@desktop @mac @regression @calculator


Feature:  Programmer Calculator View
  In order to ensure comprehensive support for various MacOS UI elements
  As a developer of the TestCentricity Apps gem
  I expect to interact with screen and menu elements of the MacOS Calculator app


  Background:
    Given I have launched the Calculator app
    And I have chosen the Programmer view


  Scenario:  Verify Programmer Calculator View
    Then I expect the Calculator screen to be correctly displayed

@bat
  Scenario Outline:  Verify calculations can be entered and yield expected result
    Given I have chosen the <number_mode> number mode
    When I execute the following programmer calculation:
      |<calculation> |
    Then I expect the result to be <result>

    Examples:
      |number_mode |calculation  |result |
      |hexadecimal |A5A5 OR 5A5A |FFFF   |
      |hexadecimal |7A5 AND D8C  |584    |
      |octal       |457 AND 642  |442    |
      |decimal     |578 OR 321   |835    |
      |hexadecimal |A5 x BE      |7A76   |


  Scenario Outline:  Verify number base conversions
    Given I have chosen the <start_mode> number mode
    And I enter <value> using the keyboard
    When I choose the <change_mode> number mode
    Then I expect the result to be <result>

    Examples:
      |start_mode  |value |change_mode |result |
      |decimal     |126   |octal       |176    |
      |hexadecimal |FF5   |decimal     |4085   |
      |octal       |457   |hexadecimal |12F    |


  Scenario Outline:  Verify ASCII and Unicode character translations
    Given I have chosen the <number_mode> number mode
    And I have chosen the <char_mode> character mode
    When I enter <value> using the <method>
    Then I expect the result character to be <result>

    Examples:
      |number_mode |char_mode |method |value |result |
      |decimal     |ASCII     |keys   |90    |Z      |
      |decimal     |ASCII     |mouse  |126   |~      |
      |decimal     |ASCII     |keys   |53    |5      |
      |hexadecimal |Unicode   |keys   |20A4  |₤      |
      |hexadecimal |Unicode   |mouse  |220B  |∋      |
      |hexadecimal |Unicode   |keys   |2021  |‡      |


  Scenario Outline:  Verify bitfield displays correct binary values
    Given I have chosen the hexadecimal number mode
    When I enter <value> using the keyboard
    Then I expect the bitfield to display the correct binary value

    Examples:
      |value            |
      |842185CA2E35B5   |
      |A5FEDCBA98765432 |


  Scenario Outline:  Verify result is correctly displayed when entering binary data
    Given I have chosen the hexadecimal number mode
    When I set the bitfield to <value>
    Then I expect the result to be <result>

    Examples:
      |value                                                            |result           |
      |1010010111111110110111001011101010011000011101100101010000110010 |A5FEDCBA98765432 |
      |0000000010000100001000011000010111001010001011100011010110110101 |842185CA2E35B5   |


  Scenario:  Window zoom switches to Basic mode
    When I zoom in the window
    Then I expect the Basic view to be displayed
