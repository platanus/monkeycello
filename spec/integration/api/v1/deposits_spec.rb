# frozen_string_literal: true

require 'swagger_helper'

describe 'API V1 Deposits', swagger_doc: 'v1/swagger.json' do
  let(:user) { create(:user) }
  let(:user_id) { user.id }

  path '/users/{user_id}/deposits' do
    parameter name: :user_id, in: :path, type: :integer
    get 'Retrieves Deposits' do
      description 'Retrieves all the deposits'
      produces 'application/json'

      let(:collection_count) { 5 }
      let(:expected_collection_count) { collection_count }

      before { create_list(:deposit, collection_count, user: user) }

      response '200', 'Deposits retrieved' do
        schema('$ref' => '#/definitions/deposits_collection')

        run_test! do |response|
          expect(JSON.parse(response.body)['data'].count).to eq(expected_collection_count)
        end
      end
    end

    post 'Creates Deposit' do
      description 'Creates Deposit'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :deposit, in: :body)

      response '201', 'deposit created' do
        let(:deposit) do
          {
            user_id: 666,
            bananas: 666
          }
        end

        run_test!
      end
    end
  end

  path '/deposits/{id}' do
    parameter name: :id, in: :path, type: :integer

    let(:existent_deposit) { create(:deposit, user: user) }
    let(:id) { existent_deposit.id }

    get 'Retrieves Deposit' do
      produces 'application/json'

      response '200', 'deposit retrieved' do
        schema('$ref' => '#/definitions/deposit_resource')

        run_test!
      end

      response '404', 'invalid deposit id' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Updates Deposit' do
      description 'Updates Deposit'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :deposit, in: :body)

      response '200', 'deposit updated' do
        let(:deposit) do
          {
            user_id: 666,
            bananas: 666
          }
        end

        run_test!
      end
    end

    delete 'Deletes Deposit' do
      produces 'application/json'
      description 'Deletes specific deposit'

      response '204', 'deposit deleted' do
        run_test!
      end

      response '404', 'deposit not found' do
        let(:id) { 'invalid' }

        run_test!
      end
    end
  end
end
