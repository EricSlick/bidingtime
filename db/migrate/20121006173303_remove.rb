class Remove < ActiveRecord::Migration
  def up
    drop_table :interviews
  end

  def down
    create_table :interviews
  end
end
