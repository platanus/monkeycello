class Monkey < ApplicationRecord
  include LedgerizerAccountable

  belongs_to :casino
  has_many :deposits, dependent: :destroy
  has_many :withdrawals, dependent: :destroy
  has_many :bets_won, class_name: "Bet", foreign_key: :winner_id, dependent: :destroy
end

# == Schema Information
#
# Table name: monkeys
#
#  id         :bigint(8)        not null, primary key
#  casino_id  :bigint(8)        not null
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_monkeys_on_casino_id  (casino_id)
#
# Foreign Keys
#
#  fk_rails_...  (casino_id => casinos.id)
#
