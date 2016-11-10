class WebmotorsExchange
  include HTTParty

  base_uri 'http://www.webmotors.com.br'

  def data
    fetch.parsed_response
  end

  def request
    fetch.request
  end

  protected

  def fetch
    raise NotImplementedError
  end
end
