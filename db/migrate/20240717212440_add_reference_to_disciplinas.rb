class AddReferenceToDisciplinas < ActiveRecord::Migration[7.1]
  def change
    add_reference :disciplinas, :periodo, foreign_key: true
  end
end
