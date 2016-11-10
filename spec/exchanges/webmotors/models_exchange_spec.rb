require 'rails_helper'

RSpec.describe Webmotors::ModelsExchange do
  let!(:make) { create :make, webmotors_id: 2 }
  let!(:models_exchange) { Webmotors::ModelsExchange.new(make) }

  let(:api_data) do
    [
      { "Nome" => "A10" },
      { "Nome" => "A20", },
      { "Nome" => "ADVANCED DESIGN" },
      { "Nome" => "AGILE" }
    ].to_json
  end

  describe '#initialize' do
    it 'has access to given make' do
      expect(models_exchange.make).to eq make
    end
  end

  context 'fetching data' do
    it 'has response status code 200' do
      expect(models_exchange.request.last_response.code).to eq "200"
    end
  end

  describe '#models' do
    subject { models_exchange.models }

    before do
      allow(models_exchange).to receive(:data).and_return(JSON.parse(api_data))
    end

    it 'initializes an array of Model' do
      is_expected.to contain_exactly(
        an_instance_of(Model), an_instance_of(Model),
        an_instance_of(Model), an_instance_of(Model)
      )
    end
  end

  describe '#save' do
    subject { models_exchange.save }

    before do
      allow(models_exchange).to receive(:data).and_return(JSON.parse(api_data))
    end

    it 'saves all valid makes' do
      expect { subject }.to change(Model, :count).by 4
    end
  end
end
