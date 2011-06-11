class CreateChallenges < ActiveRecord::Migration
  def self.up
    create_table :challenges do |t|
      t.integer :user_from_id
      t.integer :user_to_id
      t.string :challenge_txt
      t.integer :challenge_tm
      t.date :send_dt
      t.integer :accepted
      t.date :accepted_dt
      t.date :due_dt
      t.date :complete_dt
      t.timestamps
    end
  end

  def self.down
    drop_table :challenges
  end
end
