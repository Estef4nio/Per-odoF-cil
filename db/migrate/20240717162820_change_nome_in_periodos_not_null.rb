class ChangeNomeInPeriodosNotNull < ActiveRecord::Migration[7.1]
  def change
    change_column_null :periodos, :nome, false
  end
end
