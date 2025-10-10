# frozen_string_literal: true

describe TestCentricity::AppElements::AppSelectList, required: true do
  subject(:test_list) { described_class.new(:test_list, self, { accessibility_id: 'selectlist 1' }, :screen) }

  it 'returns class' do
    expect(test_list.class).to eql TestCentricity::AppElements::AppSelectList
  end

  it 'registers with type selectlist' do
    expect(test_list.get_object_type).to eql :selectlist
  end
end
