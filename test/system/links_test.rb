# test/system/links_test.rb
require "application_system_test_case"

class LinksTest < ApplicationSystemTestCase
  test "visitando a pagina inicial e criando um link curto" do
    visit root_url

    assert_selector "h1", text: "Encurtador de URLs"

    # Correção 1: Ajustamos para o texto exato que está na sua tela
    fill_in "Cole a sua URL longa aqui:", with: "https://www.ruby-lang.org"

    click_on "Encurtar URL"

    assert_text "URL encurtada com sucesso!"
    assert_text "https://www.ruby-lang.org"
  end

  # Correção 2: Mudamos o foco do teste para testar a validação de formato
  test "exibe mensagem de erro se a URL for invalida" do
    visit root_url

    # Preenchemos o campo com algo que não é uma URL válida
    fill_in "Cole a sua URL longa aqui:", with: "palavra-aleatoria"
    
    click_on "Encurtar URL"

    # Verifica se a mensagem de validação customizada apareceu na tela
    assert_text "deve ser uma URL válida" 
  end
end