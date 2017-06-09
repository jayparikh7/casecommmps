class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.integer :competition_id
      t.integer :team_id
      t.text :description

      t.timestamps

    end
  end
end
