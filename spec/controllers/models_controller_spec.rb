require 'rails_helper'

RSpec.describe ModelsController do

  describe '#index' do
    let!(:make) { create :make }

    subject(:get_index) { get :index, make_id: make.id }

    context 'exposing' do
      let!(:models) { create_list :model, 3, make: make }
      let!(:other_models) { create_list :model, 2 }

      before { get_index }

      it 'exposes make' do
        expect(controller.make).to eq make
      end

      it 'exposes models' do
        expect(controller.models).to match_array models
      end
    end

    context 'with render_views' do
      render_views

      it { is_expected.to be_success }
      it { is_expected.to render_template :index }
    end
  end
end
