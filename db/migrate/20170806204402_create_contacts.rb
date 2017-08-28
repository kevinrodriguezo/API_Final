class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :nombre
      t.string :apellido
      t.string :telefono
      t.string :puesto

      t.timestamps
    end
  end
end
