class CreatePeriodos < ActiveRecord::Migration[7.1]
  def change
    create_table :periodos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
