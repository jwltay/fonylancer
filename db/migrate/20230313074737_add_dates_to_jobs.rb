class AddDatesToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :start_date, :datetime, null: false
    add_column :jobs, :end_date, :datetime, null: false
    change_column :jobs, :title, :string, null: false
    change_column :jobs, :description, :text, null: false
    change_column :jobs, :budget, :integer, null: false
  end
end
