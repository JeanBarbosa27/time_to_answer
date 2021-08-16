require 'net/http'

class Address
  attr_reader :street, :neighborhood, :city, :state

  ENDPOINT = 'https://viacep.com.br'.freeze
  FORMAT = 'json'.freeze

  def initialize(zip_code)
    found_zip_code = find_by_zip_code(zip_code)
    @street = found_zip_code['logradouro']
    @neighborhood = found_zip_code['bairro']
    @city = found_zip_code['localidade']
    @state = found_zip_code['uf']
  end

  def get
    "#{@street}, #{@neighborhood}, #{@city} - #{@state}"
  end

  private
  
  def find_by_zip_code(zip_code)
    ActiveSupport::JSON.decode(
      Net::HTTP.get(
        URI("#{ENDPOINT}/ws/#{zip_code}/#{FORMAT}")
      )
    )
  end
end
