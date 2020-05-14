class Bet < ApplicationRecord
  include PowerTypes::Observable
  
  belongs_to :winner, class_name: "User"
  belongs_to :casino
end
