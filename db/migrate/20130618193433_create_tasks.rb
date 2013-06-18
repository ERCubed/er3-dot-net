class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :name
      t.integer :company_id
      t.integer :importance

      t.timestamps
    end
  end
end
