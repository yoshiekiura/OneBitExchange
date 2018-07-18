RSpec.configure do |config| # Estender o comportamento do RSpec
  config.before(:each) do   # Antes de qualquer teste, rode este comando
    stub_request(:get, /currencydatafeed.com/ ) # Qualquer chamada HTTP para essa URL, basicamente cai nesse stub e to_return
    .with(headers: { # Retorne o status 200 (sucess) e o body como true
      'Accept'=>'*/*'
    }).to_return(status: 200, body: '
      {
        "status": true,
        "currency": [
            {
                "currency": "USD/BRL",
                "value": "3.41325",
                "date": "2018-04-20 17:22:59",
                "type": "original"
            }
        ]
      }', headers: {}) # Não precisa de hearders
  end
end

# É o arquivo para o uso da GEM webmock