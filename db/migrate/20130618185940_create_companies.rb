class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.text :name
      t.text :job_title
      t.date :start_date
      t.date :end_date
      t.text :city
      t.text :state

      t.timestamps
    end
  end
end
