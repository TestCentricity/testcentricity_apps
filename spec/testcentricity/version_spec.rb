# frozen_string_literal: true

describe 'TestCentricityApps::VERSION', required: true do
  subject { TestCentricityApps::VERSION }

  it { is_expected.to be_truthy }
end