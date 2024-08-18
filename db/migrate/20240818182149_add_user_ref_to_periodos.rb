class AddUserRefToPeriodos < ActiveRecord::Migration[7.1]
  def change
    add_reference :periodos, :user, null: false, foreign_key: true
  end
end
