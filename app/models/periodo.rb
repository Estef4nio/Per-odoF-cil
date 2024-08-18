class Periodo < ApplicationRecord
  belongs_to :user
  has_many :disciplinas
  
  validates :user, presence: true
  validates :nome, presence: true
end
