require 'swagger_helper'

describe 'API V1 Monkeys', swagger_doc: 'v1/swagger.json' do
  let(:casino) { create(:casino) }
  let(:casino_id) { casino.id }

  path '/casinos/{casino_id}/monkeys' do
    parameter name: :casino_id, in: :path, type: :integer
    get 'Retrieves Monkeys' do
      description 'Retrieves all the monkeys'
      produces 'application/json'

      let(:collection_count) { 5 }
      let(:expected_collection_count) { collection_count }

      before { create_list(:monkey, collection_count, casino: casino) }

      response '200', 'Monkeys retrieved' do
        schema('$ref' => '#/definitions/monkeys_collection')

        run_test! do |response|
          expect(JSON.parse(response.body)['data'].count).to eq(expected_collection_count)
        end
      end
    end

    post 'Creates Monkey' do
      description 'Creates Monkey'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :monkey, in: :body)

      response '201', 'monkey created' do
        let(:monkey) do
          {
            casino_id: 666,
            name: 'Some name'
          }
        end

        run_test!
      end
    end
  end

  path '/monkeys/{id}' do
    parameter name: :id, in: :path, type: :integer

    let(:existent_monkey) { create(:monkey, casino: casino) }
    let(:id) { existent_monkey.id }

    get 'Retrieves Monkey' do
      produces 'application/json'

      response '200', 'monkey retrieved' do
        schema('$ref' => '#/definitions/monkey_resource')

        run_test!
      end

      response '404', 'invalid monkey id' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Updates Monkey' do
      description 'Updates Monkey'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :monkey, in: :body)

      response '200', 'monkey updated' do
        let(:monkey) do
          {
            casino_id: 666,
            name: 'Some name'
          }
        end

        run_test!
      end
    end

    delete 'Deletes Monkey' do
      produces 'application/json'
      description 'Deletes specific monkey'

      response '204', 'monkey deleted' do
        run_test!
      end

      response '404', 'monkey not found' do
        let(:id) { 'invalid' }

        run_test!
      end
    end
  end
end
