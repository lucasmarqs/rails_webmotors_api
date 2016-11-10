require 'rails_helper'

RSpec.describe MakesController do

  describe '#index' do
    subject(:get_index) { get :index }

    context 'exposing' do
      let!(:makes) { create_list :make, 3 }

      before { get_index }

      it 'exposes makes' do
        expect(controller.makes).to match_array makes
      end
    end

    context 'with render_views' do
      render_views

      it { is_expected.to be_success }
      it { is_expected.to render_template :index }
    end
  end
end
