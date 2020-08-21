require 'swagger_helper'

RSpec.describe 'api/usuarios', type: :request do
  path '/usuarios/sign_up' do
    post 'Criar usuário na API' do
      tags 'Usuários'
      consumes 'application/json'
      produces 'application/json'

      parameter in: :body, schema: {
        type: :object,
        properties: {
          nome: { type: :string },
          email: { type: :string },
          password: { type: :string },
          telefone: { type: :string }
        },
        required: %w[nome telefone email password]
      }

      response '200', 'Criado' do
        schema '$ref' => '#/components/schemas/usuario_logado'
        run_test!
      end
    end
  end

  path '/usuarios/sign_in' do
    post 'Autenticar na API' do
      tags 'Usuários'
      consumes 'application/json'
      produces 'application/json'

      description 'Role = função. Pode ser admin ou customer. O token está nos headers de resposta. Todas as requisições para /produtos e /comandas dependem do token'

      parameter in: :body, schema: {
        type: :object,
        properties: {
          usuario: {
            type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string }
            },
            required: %w[email password]
          }
        },
        required: %w[usuario]
      }

      response '200', 'Autenticado' do
        schema '$ref' => '#/components/schemas/usuario_logado'
        run_test!
      end
    end
  end

  path '/usuarios' do
    get 'Listar usuários' do
      tags 'Usuários'
      consumes 'application/json'
      produces 'application/json'

      description 'Rota apenas para administradores'

      response '200', 'Listado com sucesso' do
        schema '$ref' => '#/components/schemas/usuario_retornado'
        run_test!
      end
    end
  end
end
