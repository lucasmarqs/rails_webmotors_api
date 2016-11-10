module Webmotors
  class ModelsExchange < WebmotorsExchange
    attr_reader :make

    def initialize(make)
      @make = make
      @options = { query: { marca: make.webmotors_id } }
    end

    def models
      data.map do |model|
        make.models.new name: model["Nome"]
      end
    end

    def save
      models.each &:save
    end

    private

    def fetch
      @fetch ||= self.class.post("/carro/modelos", @options)
    end
  end
end
