require 'rails_helper'

RSpec.describe WebmotorsExchange do

  # dummy class for testing inheritance
  class DummyExchange < WebmotorsExchange

  end

  describe 'inheritance' do
    let(:dummy_exchange) { DummyExchange.new }

    it 'defines base_uri' do
      expect(dummy_exchange.class.base_uri).to eq 'http://www.webmotors.com.br'
    end
  end
end
