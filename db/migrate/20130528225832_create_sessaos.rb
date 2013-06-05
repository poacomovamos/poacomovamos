class CreateSessaos < ActiveRecord::Migration
  def change
    create_table :sessaos do |t|

      t.timestamps
    end
  end
end
