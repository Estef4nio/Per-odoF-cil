class Avaliacao < ApplicationRecord
  belongs_to :disciplina
  def start_time
    self.data
  end

  validates :nome, presence: true
  validates :nota, presence: true
  validates :peso, presence: true
  validates :data, presence: true

  validates :disciplina_id, presence: true
end
