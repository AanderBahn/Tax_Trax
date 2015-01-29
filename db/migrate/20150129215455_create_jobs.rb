class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :user, index: true
      t.string :name
      t.float :daily_commute
      t.string :industry

      t.timestamps
    end
  end
end
