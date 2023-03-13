class CreateBids < ActiveRecord::Migration[7.0]
  def change
    create_table :bids do |t|
      t.integer :rate, null: false
      t.boolean :accepted, default: false, null: false
      t.references :user, null: false, foreign_key: true
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
