class CreateReunions < ActiveRecord::Migration[5.0]
  def change
    create_table :reunions do |t|
      t.string :titulo
      t.datetime :fecha
      t.boolean :virtual

      t.timestamps
    end
  end
end
