class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :process_number
      t.integer :year
      t.string :type
      t.integer :number
      t.string :description
      t.datetime :processing_date
      t.string :sector
      t.string :authors
      t.string :status
      t.string :veto
      t.timestamps
    end
  end
end
