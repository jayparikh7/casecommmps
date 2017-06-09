class CreateInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|
      t.integer :creator_id
      t.integer :member_id
      t.boolean :accepted
      t.integer :team_id

      t.timestamps

    end
  end
end
