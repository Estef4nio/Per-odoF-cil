class AddReferrenceToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :periodo, foreign_key: true
  end
end
