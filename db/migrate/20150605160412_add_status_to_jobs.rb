class AddStatusToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :employee, :boolean, default: false
  end
end
