# frozen_string_literal: true

describe TestCentricity::AppElements::AppTable, required: true do
  subject(:test_table) { described_class.new(:test_table, self, { accessibility_id: 'table 1' }, :screen) }

  it 'returns class' do
    expect(test_table.class).to eql TestCentricity::AppElements::AppTable
  end

  it 'registers with type table' do
    expect(test_table.get_object_type).to eql :table
  end
end
