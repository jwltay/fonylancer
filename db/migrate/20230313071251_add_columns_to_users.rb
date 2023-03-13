class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string, null: false
    add_column :users, :name, :string, null: false
    add_column :users, :description, :text
    add_column :users, :location, :string
    add_column :users, :tagline, :string
    add_column :users, :want_to_work, :boolean, null: false
  end
end
