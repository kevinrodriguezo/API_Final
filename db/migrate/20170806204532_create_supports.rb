class CreateSupports < ActiveRecord::Migration[5.0]
  def change
    create_table :supports do |t|
      t.string :titulo
      t.string :detalle
      t.string :estado

      t.timestamps
    end
  end
end
