class Disciplina < ApplicationRecord
  belongs_to :periodo
  
  validates :nome, presence: true
  validates :carga_horaria, presence: true
  validates :creditos, presence: true
  validates :faltas, presence: true
end