class Bet < ApplicationRecord
  include PowerTypes::Observable
  include LedgerizerDocument

  belongs_to :winner, class_name: "Monkey"
  belongs_to :casino

  def bananas_bet
    Money.from_amount(5, 'BAN')
  end

  def bananas_jackpot
    bananas_bet * Monkey.count
  end
end

# == Schema Information
#
# Table name: bets
#
#  id         :bigint(8)        not null, primary key
#  winner_id  :bigint(8)        not null
#  casino_id  :bigint(8)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_bets_on_casino_id  (casino_id)
#  index_bets_on_winner_id  (winner_id)
#
# Foreign Keys
#
#  fk_rails_...  (casino_id => casinos.id)
#  fk_rails_...  (winner_id => monkeys.id)
#
