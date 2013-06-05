class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :number
      t.integer :year
      t.string :type
      t.integer :materia
      t.string :ementa
      t.datetime :processing_date
      t.string :sector
      t.string :authors
      t.string :status
      t.string :veto
      t.timestamps
    end
  end
end
