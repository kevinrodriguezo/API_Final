class Dropcolumn < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :username
  	remove_column :users, :password_digest
  end
end
