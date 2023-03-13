class RenameUserIdColumnToJobs < ActiveRecord::Migration[7.0]
  def change
    rename_column :jobs, :user_id, :employer_id
  end
end
