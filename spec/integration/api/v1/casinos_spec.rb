require 'swagger_helper'

describe 'API V1 Casinos', swagger_doc: 'v1/swagger.json' do
  path '/casinos' do
    get 'Retrieves Casinos' do
      description 'Retrieves all the casinos'
      produces 'application/json'

      let(:collection_count) { 5 }
      let(:expected_collection_count) { collection_count }

      before { create_list(:casino, collection_count) }

      response '200', 'Casinos retrieved' do
        schema('$ref' => '#/definitions/casinos_collection')

        run_test! do |response|
          expect(JSON.parse(response.body)['data'].count).to eq(expected_collection_count)
        end
      end
    end

    post 'Creates Casino' do
      description 'Creates Casino'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :casino, in: :body)

      response '201', 'casino created' do
        let(:casino) do
          {
            name: 'Some name'
          }
        end

        run_test!
      end
    end
  end

  path '/casinos/{id}' do
    parameter name: :id, in: :path, type: :integer

    let(:existent_casino) { create(:casino) }
    let(:id) { existent_casino.id }

    get 'Retrieves Casino' do
      produces 'application/json'

      response '200', 'casino retrieved' do
        schema('$ref' => '#/definitions/casino_resource')

        run_test!
      end

      response '404', 'invalid casino id' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Updates Casino' do
      description 'Updates Casino'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :casino, in: :body)

      response '200', 'casino updated' do
        let(:casino) do
          {
            name: 'Some name'
          }
        end

        run_test!
      end
    end

    delete 'Deletes Casino' do
      produces 'application/json'
      description 'Deletes specific casino'

      response '204', 'casino deleted' do
        run_test!
      end

      response '404', 'casino not found' do
        let(:id) { 'invalid' }

        run_test!
      end
    end
  end
end
