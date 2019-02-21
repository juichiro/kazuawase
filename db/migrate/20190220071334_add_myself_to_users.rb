class AddMyselfToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :myself, :string
  end
end
