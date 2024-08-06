class CreateTopicos < ActiveRecord::Migration[7.1]
  def change
    create_table :topicos do |t|
      t.string :nome
      t.boolean :estaFinalizado
      t.references :disciplina, null: false, foreign_key: true

      t.timestamps
    end
  end
end
