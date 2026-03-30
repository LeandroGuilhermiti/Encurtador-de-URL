# 🔗 Encurtador de URLs (Desafio Técnico)

Uma aplicação web desenvolvida em Ruby on Rails que funciona como um encurtador de URLs. 
Este projeto foi construído para atender aos requisitos de um desafio técnico, focando em estruturação, decisões técnicas limpas e organização de código.

## 🚀 Funcionalidades

A aplicação permite:
* Cadastrar uma URL original válida.
* Gerar automaticamente uma URL curta única (código de 6 caracteres).
* Redirecionar a URL curta para a URL original correspondente.
* Contabilizar a quantidade de acessos (cliques) realizados através da URL encurtada.
* Exibir uma página de informações contendo os dados da URL cadastrada (URL original, URL curta e cliques).

## 🛠️ Tecnologias Utilizadas

* **Linguagem:** Ruby
* **Framework:** Ruby on Rails (versão 8.1+)
* **Banco de Dados:** SQLite (padrão) / PostgreSQL
* **Testes:** Minitest (nativo do Rails) e Capybara (Testes de Sistema)

---

## 💻 Como executar o projeto localmente

## ⚠️ Pré-requisitos

Antes de começar, certifique-se de ter as seguintes ferramentas instaladas no seu computador:
* [Ruby](https://www.ruby-lang.org/pt/) (versão 3.0 ou superior)
* [Git](https://git-scm.com/)
* [PostgreSQL](https://www.postgresql.org/) (O serviço deve estar rodando localmente)
* [Google Chrome](https://www.google.com/chrome/) (Necessário para executar os Testes de Sistema)  

<br>

Para rodar esta aplicação no seu computador, siga os passos abaixo:

**1. Crie uma pasta, abra ela no terminal e clone o repositório com o comando:**
```bash
git clone https://github.com/LeandroGuilhermiti/Encurtador-de-URL.git .
```

**2. Com o projeto aberto no VScode, abra o terminal e instale as dependências:**
```bash
bundle install
```
**3. Configure as credenciais do banco de dados:**  
Crie um arquivo chamado .env na raiz do projeto (mesmo nível das pastas app e config) e adicione as suas credenciais locais do PostgreSQL:
```bash
USER_DB=seu_usuario_postgres
PASSWORD_DB=sua_senha_postgres
```

**4. Rode os comandos para criar o banco de dados e aplicar as tabelas (migrations) necessárias:**
```bash
rails db:create
rails db:migrate
```

**5. Inicie o servidor local:**
```bash
rails server
```

**6. Abra o seu navegador web favorito e acesse:**   
```bash
http://localhost:3000
```
---

## 🧪 Como executar os testes

A aplicação possui uma suíte completa de testes automatizados cobrindo as camadas de Modelo (regras de negócio e banco), Controlador (integração e rotas) e Sistema (interface do usuário).

Para executar todos os testes de uma só vez, digite no terminal:
```bash
rails test
rails test:system
```

<br>

Caso queira executar os testes separadamente por camada:

* **Testes de Modelo** (Validações e geração do código curto):
```bash
rails test test/models/link_test.rb
```

* **Testes de Controlador** (Redirecionamento, fluxo e contagem de cliques):
```bash
rails test test/controllers/links_controller_test.rb
```

* **Testes de Sistema** (Simulação da jornada do usuário na interface):
```bash
rails test:system
```