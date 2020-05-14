class User < ApplicationRecord
  include PowerTypes::Observable
  include LedgerizerAccountable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :casino
  has_many :deposits, dependent: :destroy
  has_many :withdrawals, dependent: :destroy
  has_many :bets, dependent: :destroy

  def wallet_account
    accounts.find_by(name: :wallet)
  end
end
