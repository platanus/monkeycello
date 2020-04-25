class User < ApplicationRecord
  include LedgerizerAccountable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :casino

  def wallet_account
    accounts.find_by(name: :wallet)
  end
end
