class AddRewardToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :reward, :string
  end
end
