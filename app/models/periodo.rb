class Periodo < ApplicationRecord
  has_one :user, dependent: :nullify
  has_many :disciplinas
  
  validates :nome, presence: true
end
