class RemoveNombredeMigrationFromReunions < ActiveRecord::Migration[5.0]
  def change
    remove_column :reunions, :fecha, :string
  end
end
