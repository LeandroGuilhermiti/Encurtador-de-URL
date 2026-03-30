# test/application_system_test_case.rb
require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # Configura o Rails para usar o Chrome no modo "headless" (fantasma).
  # Isso significa que ele vai testar tudo sem precisar abrir a janela do Chrome na sua tela!
  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]
end