class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :user_id, null: false
      t.string :domain, null: false
      t.string :title
      t.string :description

      t.timestamps
    end

		# force single account per domain
    # add_index :accounts, [:user_id, :domain], unique: true
    add_index :accounts, :user_id
    add_index :accounts, :domain

  end
end
