class RPNView < TestCentricity::ScreenSection
  trait(:section_name)    { 'RPN View section' }
  trait(:section_locator) { { xpath: '//XCUIElementTypeGroup[1]/XCUIElementTypeScrollView[@identifier="_NS:68"]' } }

  # RPN View section UI elements
  textfields row1_field: { xpath: '//XCUIElementTypeTable/XCUIElementTypeTableRow[1]/XCUIElementTypeTextField' },
             row2_field: { xpath: '//XCUIElementTypeTable/XCUIElementTypeTableRow[2]/XCUIElementTypeTextField' },
             row3_field: { xpath: '//XCUIElementTypeTable/XCUIElementTypeTableRow[3]/XCUIElementTypeTextField' }
end
