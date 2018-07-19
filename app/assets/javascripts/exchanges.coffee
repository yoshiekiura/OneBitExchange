$(document).ready ->

  $('form').submit -> # Verificando se o form foi submetido
    if $('form').attr('action') == '/convert' # Se o form foi submetido, a action dele é o convert.
      $.ajax '/convert', # Se sim, ele faz uma chamada AJAX pro próprio APP
          type: 'GET'
          dataType: 'json'
          data: {
                  source_currency: $("#source_currency").val(), # Comando jQuery para procurar o elemento com ID source_currency e pegar o valor
                  target_currency: $("#target_currency").val(),
                  amount: $("#amount").val()
                }
          error: (jqXHR, textStatus, errorThrown) -> # Em caso de erro, ele exibe o erro que recebeu
            alert textStatus
          success: (data, text, jqXHR) -> # Se der tudo certo, ele mostra o resultado na tela, dentro do campo result
            $('#result').val(data.value) # Retorno da API, pegando o resultado do value (valor da conversão)
        return false;