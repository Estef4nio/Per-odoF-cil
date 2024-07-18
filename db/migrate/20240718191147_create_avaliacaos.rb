class CreateAvaliacaos < ActiveRecord::Migration[7.1]
  def change
    create_table :avaliacaos do |t|
      t.string :nome
      t.text :descricao
      t.float :nota
      t.integer :peso
      t.date :data

      t.timestamps
    end
  end
end
