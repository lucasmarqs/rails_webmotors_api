require 'rails_helper'

RSpec.describe Webmotors::MakesExchange do
  let!(:makes_exchange) { Webmotors::MakesExchange.new }

  let(:api_data) do
    [
      { "Id" => 0, "Nome" => "" },
      { "Id" => 2, "Nome" => "CHEVROLET" },
      { "Id" => 2, "Nome" => "CHEVROLET" },
      { "Id" => 15, "Nome" => "FERRARI" }
    ].to_json
  end

  context 'fetching data' do
    it 'has response status code 200' do
      expect(makes_exchange.request.last_response.code).to eq "200"
    end
  end

  describe '#makes' do
    subject { makes_exchange.makes }

    before do
      allow(makes_exchange).to receive(:data).and_return(JSON.parse(api_data))
    end

    it 'initializes an array of Make' do
      is_expected.to contain_exactly(
        an_instance_of(Make), an_instance_of(Make),
        an_instance_of(Make), an_instance_of(Make)
      )
    end
  end

  describe '#save' do
    subject { makes_exchange.save }

    before do
      allow(makes_exchange).to receive(:data).and_return(JSON.parse(api_data))
    end

    it 'saves all valid makes' do
      expect { subject }.to change(Make, :count).by 2
    end
  end
end
