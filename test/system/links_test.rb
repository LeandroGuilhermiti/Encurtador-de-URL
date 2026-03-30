require "application_system_test_case"

class LinksTest < ApplicationSystemTestCase
  test "visitando a pagina inicial e criando um link curto" do
    #Simula o usuário acessando o site
    visit root_url
    
    #Verifica se o título principal (H1) está aparecendo na tela
    assert_selector "h1", text: "Encurtador de URLs"

    # Simula o usuário digitando no campo do formulário
    # Ele procura o campo pelo texto da etiqueta (label) 
    fill_in "Cole a sua URL longa aqui:", with: "https://www.ruby-lang.org"

    #Simula o clique no botão de enviar
    click_on "Encurtar URL"

    #Verifica se o sistema foi para a próxima tela e exibiu a mensagem de sucesso
    assert_text "URL encurtada com sucesso!"

    #Verifica se a URL original que digitamos aparece na tela de informações
    assert_text "https://www.ruby-lang.org"
  end

  test "exibe mensagem de erro se a URL for invalida" do
    visit root_url

    #Preenche o campo com algo que não é uma URL válida
    fill_in "Cole a sua URL longa aqui:", with: "palavra-aleatoria"
    
    click_on "Encurtar URL"

    # Verifica se a sua mensagem de validação customizada apareceu na tela
    assert_text "deve ser uma URL válida" 
  end
end