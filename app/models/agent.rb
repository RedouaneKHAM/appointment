class Agent < ApplicationRecord
  belongs_to :user
  has_many :arrangements
end
