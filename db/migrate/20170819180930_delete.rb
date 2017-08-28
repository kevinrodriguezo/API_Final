class Delete < ActiveRecord::Migration[5.0]
  def change
  	remove_reference(:reunions, :users, index: true, foreign_key: true)
  	remove_reference(:supports, :users, index: true, foreign_key: true)
  	remove_reference(:contacts, :clients, index: true, foreign_key: true)
  	remove_reference(:reunions, :clients, index: true, foreign_key: true)
  	remove_reference(:supports, :clients, index: true, foreign_key: true)

  	add_reference :reunions, :users, foreign_key: true, on_delete: :cascade
  	add_reference :supports, :users, foreign_key: true, on_delete: :cascade
  	add_reference :contacts, :clients, foreign_key: true, on_delete: :cascade
  	add_reference :reunions, :clients, foreign_key: true, on_delete: :cascade
  	add_reference :supports, :clients, foreign_key: true, on_delete: :cascade
  end
end
