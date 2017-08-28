class Key < ActiveRecord::Migration[5.0]
  def change
  	add_reference :reunions, :users, foreign_key: true
  	add_reference :supports, :users, foreign_key: true
  	add_reference :contacts, :clients, foreign_key: true
  	add_reference :reunions, :clients, foreign_key: true
  	add_reference :supports, :clients, foreign_key: true
  end
end
