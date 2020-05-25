class Withdrawal < ApplicationRecord
  include PowerTypes::Observable
  include LedgerizerDocument

  belongs_to :monkey

  def bananas
    Money.from_amount(amount, 'BAN')
  end

  def fee
    Money.from_amount(1, 'BAN')
  end
end

# == Schema Information
#
# Table name: withdrawals
#
#  id         :bigint(8)        not null, primary key
#  monkey_id  :bigint(8)        not null
#  amount     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_withdrawals_on_monkey_id  (monkey_id)
#
# Foreign Keys
#
#  fk_rails_...  (monkey_id => monkeys.id)
#
