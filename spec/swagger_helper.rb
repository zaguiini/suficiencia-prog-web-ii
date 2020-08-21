# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'RestAPIFurb',
        version: 'v1'
      },
      servers: [
        {
          url: 'http://localhost:8080/RestAPIFurb'
        }
      ],
      components: {
        schemas: {
          produto: {
            type: 'object',
            properties: {
              id: { type: :integer },
              nome: { type: :string },
              preco: { type: :integer }
            }
          },
          comanda: {
            type: 'object',
            properties: {
              id: { type: :integer },
              usuario: { '$ref' => '#/components/schemas/usuario' },
              itens: {
                type: :array,
                items: { '$ref' => '#/components/schemas/item' }
              },
              preco_total: { type: :integer }
            }
          },
          usuario: {
            type: 'object',
            properties: {
              usuario_id: { type: :integer },
              nome: { type: :string },
              telefone: { type: :string }
            }
          },
          usuario_logado: {
            type: 'object',
            properties: {
              id: { type: :integer },
              nome: { type: :string },
              telefone: { type: :string },
              email: { type: :string },
              created_at: { type: :string },
              updated_at: { type: :string },
              role: { type: :string }
            }
          },
          usuario_retornado: {
            type: 'object',
            properties: {
              id: { type: :integer },
              nome: { type: :string },
              telefone: { type: :string },
              email: { type: :string },
              funcao: { type: :string }
            }
          },
          item: {
            type: 'object',
            properties: {
              item_id: { type: :integer },
              produto_id: { type: :integer },
              nome: { type: :string },
              quantidade: { type: :integer },
              preco: { type: :integer },
              observacoes: { type: :string }
            }
          }
        }
      }
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The swagger_docs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.swagger_format = :yaml
end
