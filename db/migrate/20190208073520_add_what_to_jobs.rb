class AddWhatToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :what, :string
  end
end
