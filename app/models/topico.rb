class Topico < ApplicationRecord
  belongs_to :disciplina

  validates :nome, presence: true
end
