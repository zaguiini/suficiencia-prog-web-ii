require 'swagger_helper'

RSpec.describe 'api/produtos', type: :request do
  path '/RestAPIFurb' do
    post "Create an Encounter" do
      tags "Encounters"
      consumes "application/json"
      parameter name: :encounter, in: :body, schema: {
          type: :object,
          properties: {
              patient_id: { type: :integer },
              provider_id: { type: :integer },
          },
          required: ["patient_id", "provider_id"],
      }
      response "201", "encounter created" do
        let(:encounter) { { patient_id: 10, provider_id: 1 } }
        run_test!
      end
      response "422", "invalid request" do
        let(:encounter) { { patient_id: 10 } }
        run_test!
      end
    end
  end
end
