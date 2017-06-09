class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.integer :creator_id
      t.integer :competitions_id
      t.string :name
      t.integer :number_members

      t.timestamps

    end
  end
end
