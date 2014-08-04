class CreateAccounts < ActiveRecord::Migration
  def change
    
    create_table :accounts do |t|
      t.integer :user_id
      t.string :domain, null: false
      t.text :cookie, null: false
      t.string :title
      t.string :description
      t.string :url
      
      t.timestamps
    end

		# force single account per domain
    add_index :accounts, [:cookie, :domain], unique: true
    add_index :accounts, :user_id
    add_index :accounts, :domain

  end
end
