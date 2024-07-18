class AddReferenceToAvaliacaos < ActiveRecord::Migration[7.1]
  def change
    add_reference :avaliacaos, :disciplina, null: false, foreign_key: true
  end
end
