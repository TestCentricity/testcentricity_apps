# frozen_string_literal: true

describe TestCentricity::MenuBar, required: true do
  before :context do
    @test_screen = TestScreen.new
    @test_menubar = @test_screen.menubar1
  end

  context 'menubar object traits' do
    it 'returns section name' do
      expect(@test_menubar.section_name).to eq('Menu Bar')
    end

    it 'returns section locator' do
      expect(@test_menubar.get_locator).to eq([{ class_chain: '**/XCUIElementTypeMenuBar' }])
    end

    it 'returns class' do
      expect(@test_menubar.class).to eql TestMenuBar
    end

    it 'registers with type menubar' do
      expect(@test_menubar.get_object_type).to eql :menubar
    end

    it 'responds to exists?' do
      expect(@test_menubar).to respond_to(:exists?)
    end

    it 'should know if menubar exists' do
      allow(@test_menubar).to receive(:exists?).and_return(true)
      expect(@test_menubar.exists?).to be true
    end

    it 'should know if menubar is enabled' do
      allow(@test_menubar).to receive(:enabled?).and_return(true)
      expect(@test_menubar.enabled?).to eq(true)
    end

    it 'should know if menubar is disabled' do
      allow(@test_menubar).to receive(:disabled?).and_return(true)
      expect(@test_menubar.disabled?).to eq(true)
    end
  end

  context 'menubar object with menu elements' do
    it 'responds to element' do
      expect(@test_menubar).to respond_to(:menu1)
    end
  end
end
