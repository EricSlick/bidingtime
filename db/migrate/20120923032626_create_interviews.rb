class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.string :title
      t.text :body
      t.string :image_url

      t.timestamps
    end
  end
end
