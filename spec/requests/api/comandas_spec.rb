require 'swagger_helper'

RSpec.describe 'api/comandas', type: :request do
  path '/comandas' do
    get 'Listar comandas' do
      tags 'Comandas'
      consumes 'application/json'
      produces 'application/json'

      response '200', 'Comandas recuperadas' do
        schema type: :array, items: { '$ref' => '#/components/schemas/comanda' }
        run_test!
      end
    end

    post 'Criar uma comanda' do
      tags 'Comandas'
      consumes 'application/json'
      produces 'application/json'

      description 'É possível adicionar usuario_id se o usuário logado houver a função "admin"'

      parameter in: :body, schema: {
        type: :object,
        properties: {
          usuario_id: { type: :string },
          itens: {
            type: :array,
            items: {
              type: :object,
              properties: {
                produto_id: { type: :number },
                quantidade: { type: :number },
                preco: { type: :number },
                observacoes: { type: :string }
              },
              required: %w[produto_id quantidade]
            }
          }
        },
        required: %w[itens]
      }

      response '200', 'Comanda criada' do
        schema '$ref' => '#/components/schemas/comanda'
        run_test!
      end
    end
  end

  path '/comandas/{id}' do
    get 'Recuperar uma comanda' do
      tags 'Comandas'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :id, in: :path, type: :number

      response '200', 'Comanda recuperada' do
        schema '$ref' => '#/components/schemas/comanda'
        run_test!
      end
    end

    put 'Editar uma comanda' do
      tags 'Comandas'
      consumes 'application/json'
      produces 'application/json'

      description 'É possível adicionar usuario_id se o usuário logado houver a função "admin". É possível editar um item da comanda caso o argumento item_id seja enviado'

      parameter name: :id, in: :path, type: :number

      parameter in: :body, schema: {
        type: :object,
        properties: {
          itens: {
            type: :array,
            items: {
              type: :object,
              properties: {
                item_id: { type: :number },
                produto_id: { type: :number },
                quantidade: { type: :number },
                preco: { type: :number },
                observacoes: { type: :string }
              },
            }
          }
        }
      }

      response '200', 'Comanda atualizada' do
        schema '$ref' => '#/components/schemas/comanda'
        run_test!
      end
    end

    delete 'Apagar uma comanda' do
      tags 'Comandas'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :id, in: :path, type: :number

      response '200', 'Comanda apagada' do
        schema '$ref' => '#/components/schemas/recurso_apagado'
        run_test!
      end
    end
  end
end
