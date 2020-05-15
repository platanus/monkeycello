class Casino < ApplicationRecord
  has_many :monkeys
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
