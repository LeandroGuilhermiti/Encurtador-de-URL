# test/controllers/links_controller_test.rb
require "test_helper"

class LinksControllerTest < ActionDispatch::IntegrationTest

  setup do
    @link = Link.create!(url_original: "https://rubyonrails.org", url_short: "rails1", clicks_count: 0)
  end

  test "deve acessar a pagina inicial com o formulario" do
    get root_url
    assert_response :success 
  end

  test "deve criar um link encurtado e redirecionar para a pagina de info" do
    # Verifica se a quantidade de Links no banco de dados aumentou em 1
    assert_difference("Link.count", 1) do
      # Simula o 'submit' do formulário enviando os parâmetros
      post links_url, params: { link: { url_original: "https://www.ruby-lang.org" } }
    end
  end

  test "deve mostrar a pagina de informacoes do link" do
    get info_link_url(@link.url_short)
    assert_response :success
  end

  test "deve redirecionar para a url original e somar 1 no contador" do
    get short_redirect_url(@link.url_short)

    # 1. Verifica se o sistema tentou redirecionar para o site original
    assert_redirected_to @link.url_original

    # 2. Recarrega o @link com os dados atualizados do banco
    @link.reload 
    
    # 3. Verifica se o contador de cliques subiu de 0 para 1
    assert_equal 1, @link.clicks_count
  end
end