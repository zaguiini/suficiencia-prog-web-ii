require 'swagger_helper'

RSpec.describe 'api/produtos', type: :request do
  path '/produtos' do
    get 'Listar produtos' do
      tags 'Produtos'
      consumes 'application/json'
      produces 'application/json'

      response '200', 'Produtos recuperados' do
        schema type: :array, items: { '$ref' => '#/components/schemas/produto' }
        run_test!
      end
    end

    post 'Criar um produto' do
      tags 'Produtos'
      consumes 'application/json'
      produces 'application/json'

      parameter in: :body, schema: {
        type: :object,
        properties: {
          nome: { type: :string },
          preco: { type: :number }
        },
        required: %w[nome preco]
      }

      response '200', 'Produto criado' do
        schema '$ref' => '#/components/schemas/produto'
        run_test!
      end
    end
  end

  path '/produtos/{id}' do
    get 'Recuperar um produto' do
      tags 'Produtos'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :id, in: :path, type: :number

      response '200', 'Produto recuperado' do
        schema '$ref' => '#/components/schemas/produto'
        run_test!
      end
    end

    put 'Editar um produto' do
      tags 'Produtos'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :id, in: :path, type: :number
      parameter in: :body, schema: {
        type: :object,
        properties: {
          nome: { type: :string },
          preco: { type: :number }
        }
      }

      response '200', 'Produto atualizado' do
        schema '$ref' => '#/components/schemas/produto'
        run_test!
      end
    end

    delete 'Apagar um produto' do
      tags 'Produtos'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :id, in: :path, type: :number

      response '200', 'Produto apagado' do
        schema '$ref' => '#/components/schemas/recurso_apagado'
        run_test!
      end
    end
  end
end
