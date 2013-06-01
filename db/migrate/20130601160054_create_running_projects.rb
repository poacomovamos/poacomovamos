class CreateRunningProjects < ActiveRecord::Migration
  def change
    create_table :running_projects do |t|
      t.integer :number
      t.integer :year
      t.string :type
      t.string :materia
      t.string :ementa
      t.datetime :processing_date
      t.string :sector
      t.string :authors
      t.string :veto
      t.timestamps
    end
  end
end
