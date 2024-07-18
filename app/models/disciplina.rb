class Disciplina < ApplicationRecord
  belongs_to :periodo
  has_many :avaliacaos
  
  validates :nome, presence: true
  validates :carga_horaria, presence: true
  validates :creditos, presence: true
  validates :faltas, presence: true
end