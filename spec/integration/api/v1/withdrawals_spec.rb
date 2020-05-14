# frozen_string_literal: true

require 'swagger_helper'

describe 'API V1 Withdrawals', swagger_doc: 'v1/swagger.json' do
  let(:user) { create(:user) }
  let(:user_id) { user.id }

  path '/users/{user_id}/withdrawals' do
    parameter name: :user_id, in: :path, type: :integer
    get 'Retrieves Withdrawals' do
      description 'Retrieves all the withdrawals'
      produces 'application/json'

      let(:collection_count) { 5 }
      let(:expected_collection_count) { collection_count }

      before { create_list(:withdrawal, collection_count, user: user) }

      response '200', 'Withdrawals retrieved' do
        schema('$ref' => '#/definitions/withdrawals_collection')

        run_test! do |response|
          expect(JSON.parse(response.body)['data'].count).to eq(expected_collection_count)
        end
      end
    end

    post 'Creates Withdrawal' do
      description 'Creates Withdrawal'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :withdrawal, in: :body)

      response '201', 'withdrawal created' do
        let(:withdrawal) do
          {
            user_id: 666,
            bananas: 666
          }
        end

        run_test!
      end
    end
  end

  path '/withdrawals/{id}' do
    parameter name: :id, in: :path, type: :integer

    let(:existent_withdrawal) { create(:withdrawal, user: user) }
    let(:id) { existent_withdrawal.id }

    get 'Retrieves Withdrawal' do
      produces 'application/json'

      response '200', 'withdrawal retrieved' do
        schema('$ref' => '#/definitions/withdrawal_resource')

        run_test!
      end

      response '404', 'invalid withdrawal id' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Updates Withdrawal' do
      description 'Updates Withdrawal'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :withdrawal, in: :body)

      response '200', 'withdrawal updated' do
        let(:withdrawal) do
          {
            user_id: 666,
            bananas: 666
          }
        end

        run_test!
      end
    end

    delete 'Deletes Withdrawal' do
      produces 'application/json'
      description 'Deletes specific withdrawal'

      response '204', 'withdrawal deleted' do
        run_test!
      end

      response '404', 'withdrawal not found' do
        let(:id) { 'invalid' }

        run_test!
      end
    end
  end
end
