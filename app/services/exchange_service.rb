# Chamando a API do CurrencyDataFeed

require 'rest-client'
require 'json'

# O service em geral é constituído de duas funções pelo menos.
# A primeira delas é o Initialize para preencher as principais variáveis
# Dentro do perform é onde o código existe

class ExchangeService
  def initialize(source_currency, target_currency, amount)
    @source_currency = source_currency
    @target_currency = target_currency
    @amount = amount.to_f
  end

 
  def perform
    begin # O código que faz a chamada
      # Rails.env.to_sym = força o resultado a vir em símbolo, sendo o :currency_api_url ou key
      exchange_api_url = Rails.application.credentials[Rails.env.to_sym][:currency_api_url] # Chamando a URL do EDITOR=nano rails credentials:edit
      exchange_api_key = Rails.application.credentials[Rails.env.to_sym][:currency_api_key] # Chamando a KEY do EDITOR=nano rails credentials:edit
      url = "#{exchange_api_url}?token=#{exchange_api_key}&currency=#{@source_currency}/#{@target_currency}" # Injetando o conteúdo de uma variável na STRING
      res = RestClient.get url # Usando o restclient e dando um GET
      value = JSON.parse(res.body)['currency'][0]['value'].to_f # JSON.parse(res.body) faz um hash para navegar na resposta e converte a respota pra float
      
      value * @amount # Lógica para o resultado final
    rescue RestClient::ExceptionWithResponse => e
      e.response # Em caso de erro, execute o rescue
    end
  end
end