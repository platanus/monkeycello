# frozen_string_literal: true

require 'swagger_helper'

describe 'API V1 Bets', swagger_doc: 'v1/swagger.json' do
  let(:user) { create(:user) }
  let(:user_id) { user.id }

  path '/users/{user_id}/bets' do
    parameter name: :user_id, in: :path, type: :integer
    get 'Retrieves Bets' do
      description 'Retrieves all the bets'
      produces 'application/json'

      let(:collection_count) { 5 }
      let(:expected_collection_count) { collection_count }

      before { create_list(:bet, collection_count, user: user) }

      response '200', 'Bets retrieved' do
        schema('$ref' => '#/definitions/bets_collection')

        run_test! do |response|
          expect(JSON.parse(response.body)['data'].count).to eq(expected_collection_count)
        end
      end
    end

    post 'Creates Bet' do
      description 'Creates Bet'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :bet, in: :body)

      response '201', 'bet created' do
        let(:bet) do
          {
            winner_id: 666,
            casino_id: 666
          }
        end

        run_test!
      end
    end
  end

  path '/bets/{id}' do
    parameter name: :id, in: :path, type: :integer

    let(:existent_bet) { create(:bet, user: user) }
    let(:id) { existent_bet.id }

    get 'Retrieves Bet' do
      produces 'application/json'

      response '200', 'bet retrieved' do
        schema('$ref' => '#/definitions/bet_resource')

        run_test!
      end

      response '404', 'invalid bet id' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Updates Bet' do
      description 'Updates Bet'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :bet, in: :body)

      response '200', 'bet updated' do
        let(:bet) do
          {
            winner_id: 666,
            casino_id: 666
          }
        end

        run_test!
      end
    end

    delete 'Deletes Bet' do
      produces 'application/json'
      description 'Deletes specific bet'

      response '204', 'bet deleted' do
        run_test!
      end

      response '404', 'bet not found' do
        let(:id) { 'invalid' }

        run_test!
      end
    end
  end
end
