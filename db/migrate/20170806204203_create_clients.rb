class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :nombre
      t.string :cedula
      t.string :pagina
      t.string :direccion
      t.integer :telefono
      t.string :sector

      t.timestamps
    end
  end
end
