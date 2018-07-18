require 'spec_helper'
require 'json'
require './app/services/exchange_service'

describe 'Currency' do
  it 'exchange' do
    amount = rand(0..9999) # Gera um número aleatório
    res = ExchangeService.new("USD", "BRL", amount).perform # Chamando o service e (passando quantidade para executar o test)
    expect(res.is_a? Numeric).to eql(true) # res é um número? true
    expect(res != 0 || amount == 0).to eql(true) # res é diferente de zero quando o amount é zero?
  end
end