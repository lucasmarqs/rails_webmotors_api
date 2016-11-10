module Webmotors
  class MakesExchange < WebmotorsExchange

    def makes
      @makes ||= data.map do |make|
        Make.new webmotors_id: make["Id"], name: make["Nome"]
      end
    end

    def save
      makes.each &:save
    end

    private

    def fetch
      @fetch ||= self.class.post("/carro/marcas")
    end
  end
end
