require 'rails_helper'

RSpec.describe Model do

  context 'associations' do
    it { is_expected.to belong_to :make }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :make }
  end
end
