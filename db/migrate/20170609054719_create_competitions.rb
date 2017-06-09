class CreateCompetitions < ActiveRecord::Migration[5.0]
  def change
    create_table :competitions do |t|
      t.string :name
      t.string :sponsor
      t.string :location
      t.text :description
      t.float :prize_money
      t.string :topic
      t.datetime :deadline
      t.boolean :teams
      t.boolean :max_teams
      t.integer :max

      t.timestamps

    end
  end
end
