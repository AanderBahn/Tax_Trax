class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :car
      t.string :jobs

      t.timestamps

    end
  end
end
