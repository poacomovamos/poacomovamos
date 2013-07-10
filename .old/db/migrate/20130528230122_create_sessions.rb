class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :number
      t.string :session_type
      t.datetime :date
      t.timestamps
    end
  end
end
