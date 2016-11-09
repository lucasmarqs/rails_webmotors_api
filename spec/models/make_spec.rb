require 'rails_helper'

RSpec.describe Make do

  context 'associations' do
    it { is_expected.to have_many :models }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :webmotors_id }

    context 'uniqueness' do
      subject { Make.new name: 'make_name', webmotors_id: 1 }

      it { is_expected.to validate_uniqueness_of :webmotors_id }
    end
  end
end
