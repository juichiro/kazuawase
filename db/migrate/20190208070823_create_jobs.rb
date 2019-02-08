class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :when
      t.string :place
      t.string :detail
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
