class Update2 < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :session_token, :string, null: false
    change_column :users, :username, :string ,null: false 
    change_column :users, :password_digest, :string, null: false 
  end
end
