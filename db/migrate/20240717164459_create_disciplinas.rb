class CreateDisciplinas < ActiveRecord::Migration[7.1]
  def change
    create_table :disciplinas do |t|
      t.string :nome, null: false
      t.integer :carga_horaria, null: false
      t.integer :creditos, null: false
      t.integer :faltas, default: 0, null: false

      t.timestamps
    end
  end
end
 