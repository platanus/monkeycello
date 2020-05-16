class Deposit < ApplicationRecord
  include LedgerizerDocument

  belongs_to :monkey

  def bananas
    Money.from_amount(amount, 'BAN')
  end
end

# == Schema Information
#
# Table name: deposits
#
#  id         :bigint(8)        not null, primary key
#  monkey_id  :bigint(8)        not null
#  amount     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_deposits_on_monkey_id  (monkey_id)
#
# Foreign Keys
#
#  fk_rails_...  (monkey_id => monkeys.id)
#
