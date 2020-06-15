class Casino < ApplicationRecord
  include PowerTypes::Observable
  include LedgerizerTenant

  has_many :monkeys, dependent: :destroy
  has_many :bets, dependent: :destroy
end

# == Schema Information
#
# Table name: casinos
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
