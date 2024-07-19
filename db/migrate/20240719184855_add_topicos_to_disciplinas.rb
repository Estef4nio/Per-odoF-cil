class AddTopicosToDisciplinas < ActiveRecord::Migration[7.1]
  def change
    add_column :disciplinas, :topics, :text, default: [].to_json
  end
end
