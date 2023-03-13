class RenameColumnToBids < ActiveRecord::Migration[7.0]
  def change
    rename_column :bids, :user_id, :freelancer_id
  end
end
