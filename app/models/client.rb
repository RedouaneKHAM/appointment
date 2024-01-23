class Client < ApplicationRecord
  belongs_to :user
  has_many :arrangements
  has_many :agents, through: :arrangements
end
