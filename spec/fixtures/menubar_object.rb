class TestMenuBar < TestCentricity::MenuBar
  menus menu1: { class_chain: '**/XCUIElementTypeMenuBarItem[1]' },
        menu2: { class_chain: '**/XCUIElementTypeMenuBarItem[2]' }
end
