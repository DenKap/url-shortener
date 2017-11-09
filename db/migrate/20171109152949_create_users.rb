class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :provider, null: false, default: ''
      t.string  :uid, null: false, default: ''
      t.timestamps
    end

    add_index :users, :provider
    add_index :users, :uid
  end
end
