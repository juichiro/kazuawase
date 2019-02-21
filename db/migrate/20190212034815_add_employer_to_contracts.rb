class AddEmployerToContracts < ActiveRecord::Migration[5.2]
  def change
    add_reference :contracts, :employer, foreign_key: { to_table: :users }
  end
end
