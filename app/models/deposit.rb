class Deposit < ApplicationRecord
  include PowerTypes::Observable
  include LedgerizerDocument

  belongs_to :user
end
