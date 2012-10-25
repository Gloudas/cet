class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.integer :creator_id
      t.integer :school_id
      t.timestamps
    end
  end
end
